// (1) 导入数据并生成时间序列
clear  // 清空变量
insheet using "Bindex.csv"  //导入位于和代码同一文件夹下的csv数据文件
gen datevar = date(date,"YMD")   // 将csv中的变量date转换为stata能识别的时间数据datevar
format datevar %td // 对datevar的展示格式进行转换，转换后以:日月年 显示
label variable datevar "日期"  // 设置datevar的标签为日期，主要用于画图时的展示
tsset datevar   // 定义datevar是一个时间序列数据
gen time=_n  // 定义一个从1到n的time序列，n是观测值的个数，系统自动在后台记录的
tsset time   // 将time这个序列定义为时间序列，后续滞后算子时需要用到


// 画深成B指的时间序列图
line index datevar   
graph export "深成B指的时间序列图.png", as(png) replace   // 导出图片到本地文件夹

// 计算日收益率数据
gen r=100*(index-L.index)/L.index   //（今天的收盘价-昨天的收盘价）/昨天的收盘价   L是lag的缩写

// 对日收益率r进行描述性统计
summarize r  

// 做出日收益率的时间序列图
line r datevar
graph export "深成B指日收益率的时间序列图.png", as(png) replace   // 导出图片到本地文件夹


// 检验收益率序列r是否为单位根,检验方法是ADF检验(原假设：是单位根序列，备择假设：是平稳序列)
dfuller r
// MacKinnon approximate p-value for Z(t) = 0.0000  p值为0意味着拒绝原假设，所以我们认为r序列平稳


// 观察acf图与pacf图 ，判断AMRA模型的阶数
ac r,lags(20)   // 自相关系数图，滞后20期
graph export "自相关系数图.png", as(png) replace   // 导出图片到本地文件夹

pac r,lags(20)  // 偏自相关系数图，滞后20期
graph export "偏自相关系数图.png", as(png) replace   // 导出图片到本地文件夹


// 根据acf和pacf图，初步判断使用四个备选的ARMA模型来拟合
set matsize 1500  // 把计算时支持的最大矩阵大小设置的大一点，否则计算机性能较差的电脑可能在计算中会报错
arima r,arima(3,0,3)   // 用ARIMA(3,0,3)模型对r进行估计
estat ic   // 得到AIC和BIC，用于选择合适的模型（选小原则，详见第十一讲）
arima r,arima(8,0,8)
estat ic
arima r,arima(3,0,8)
estat ic
arima r,arima(8,0,3)
estat ic


// ARIMA(3,0,3)模型的AIC值和BIC值的平均值最小，所以下面我们使用这个模型进行估计 
arima r,arima(3,0,3)

// 得到残差的预测值并生成残差分布直方图图
predict residess, residuals   // 保存残差
hist residess,norm freq  // norm freq表示加上标准正态分布的概率密度函数
graph export "残差分布直方图.png", as(png) replace   // 导出图片到本地文件夹


// 检验残差是否为白噪声序列，检验方法为Q检验：原假设是白噪声，备择假设不是白噪声
wntestq residess, lag(12)   // 对残差序列进行白噪声检验

// 生成残差的平方，并进行Q检验
gen ressq = resides^2   // 生成残差平方序列ressq
wntestq ressq, lag(12) // 对残差平方序列ressq进行白噪声检验

// LM检验：是否存在ARCH误差
reg ressq l.ressq l2.ressq l3.ressq l4.ressq l5.ressq  // 将残差平方项对其滞后项回归
gen LM_STAT=e(N)*e(r2) // 计算LM统计量
display LM_STAT  // 输出LM统计量
display chiprob(e(df_m),LM_STAT) // 计算p值


// 利用AIC BIC选择合适的模型进行估计 
// 注意：扰动项的分布在金融数据中常服从t分布
// 正态分布下GARCH(1,1)估计
arch r,arima(3 0 3) arch(1) garch(1)
estat ic
// t分布下GARCH(1,1)估计
arch r,arima(3 0 3) arch(1) garch(1) distribution(t 3)  // 自由度为3的t分布
estat ic
// 正态分布下GARCH(2,2)估计
arch r,arima(3 0 3) arch(2) garch(2)
estat ic
// t分布下GARCH(2,2)估计
arch r,arima(3 0 3) arch(2) garch(2) distribution(t 3)
estat ic


// 得到拟合结果，并进行预测
arch r,arima(3 0 3) arch(1) garch(1) distribution(t 3)
tsappend ,add(10)  // 将时间延长10期
predict result // 对数据进行预测
tsline result r, legend(label(1 "预测值")  label(2 "真实值"))   // 绘制拟合图
graph export "预测结果图.png", as(png) replace   // 导出图片到本地文件夹



// 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
// 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
// 视频中提到的附件可在售后群（购买后收到的那个有道云笔记中有加入方式）的群文件中下载。包括讲义、代码、优秀的作业、我视频中推荐的资料等。
// 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
// 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
// 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
// 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）
