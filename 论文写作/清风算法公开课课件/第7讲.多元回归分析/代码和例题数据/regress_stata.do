// 按键盘上的PageUp可以使用上一次输入的代码（Matleb中是上箭头）
// 清除所有变量
clear
// 清屏 和 matlab的clc类似
cls 
// 导入数据（其实是我们直接在界面上粘贴过来的，我们用鼠标点界面导入更方便 本条请删除后再复制到论文中，如果评委老师看到了就知道这不是你写的了）
// import excel "C:\Users\hc_lzp\Desktop\数学建模视频录制\第7讲.多元回归分析\代码和例题数据\课堂中讲解的奶粉数据.xlsx", sheet("Sheet1") firstrow
import excel "课堂中讲解的奶粉数据.xlsx", sheet("Sheet1") firstrow
// 定量变量的描述性统计
summarize 团购价元 评价量 商品毛重kg
// 定性变量的频数分布，并得到相应字母开头的虚拟变量
tabulate 配方,gen(A)
tabulate 奶源产地 ,gen(B)
tabulate 国产或进口 ,gen(C)
tabulate 适用年龄岁 ,gen(D)
tabulate 包装单位 ,gen(E)
tabulate 分类 ,gen(F)
tabulate 段位 ,gen(G)
// 下面进行回归
regress 评价量 团购价元 商品毛重kg
// 下面的语句可帮助我们把回归结果保存在Word文档中
// 在使用之前需要运行下面这个代码来安装下这个功能包（运行一次之后就可以注释掉了）
// ssc install reg2docx, all replace
est store m1
reg2docx m1 using m1.docx, replace
// *** p<0.01  ** p<0.05 * p<0.1

// Stata会自动剔除多重共线性的变量
regress 评价量 团购价元 商品毛重kg A1 A2 A3 B1 B2 B3 B4 B5 B6 B7 B8 B9 C1 C2 D1 D2 D3 D4 D5 E1 E2 E3 E4 F1 F2 G1 G2 G3 G4
est store m2
reg2docx m2 using m2.docx, replace

// 得到标准化回归系数
regress 评价量 团购价元 商品毛重kg, b 

// 画出残差图
regress 评价量 团购价元 商品毛重kg A1 A2 A3 B1 B2 B3 B4 B5 B6 B7 B8 B9 C1 C2 D1 D2 D3 D4 D5 E1 E2 E3 E4 F1 F2 G1 G2 G3 G4
rvfplot 
// 残差与拟合值的散点图
graph export a1.png ,replace
// 残差与自变量团购价的散点图
rvpplot  团购价元
graph export a2.png ,replace

// 为什么评价量的拟合值会出现负数？
// 描述性统计并给出分位数对应的数值
summarize 评价量,d

// 作评价量的概率密度估计图
kdensity 评价量 
graph export a3.png ,replace

// 异方差BP检验
estat hettest ,rhs iid

// 异方差怀特检验
estat imtest,white

// 使用OLS + 稳健的标准误
regress 评价量 团购价元 商品毛重kg A1 A2 A3 B1 B2 B3 B4 B5 B6 B7 B8 B9 C1 C2 D1 D2 D3 D4 D5 E1 E2 E3 E4 F1 F2 G1 G2 G3 G4, r
est store m3
reg2docx m3 using m3.docx, replace

// 计算VIF
estat  vif

// 逐步回归（一定要注意完全多重共线性的影响）
// 向前逐步回归
stepwise reg 评价量 团购价元 商品毛重kg A1 A3 B1 B2 B3 B4 B5 B6 B7 B9 C1 D1 D2 D3 D4 E1 E2 E3 F1 G1 G2 G3,  r pe(0.05)
// 向后逐步回归
stepwise reg 评价量 团购价元 商品毛重kg A1 A3 B1 B2 B3 B4 B5 B6 B7 B9 C1 D1 D2 D3 D4 E1 E2 E3 F1 G1 G2 G3,  r pr(0.05)

// 补充语法 (大家不需要具体的去学Stata软件，掌握我课堂上教给大家的一些命令应对数学建模比赛就可以啦)
// 事实上大家学好Excel，学好后应对90%的数据预处理问题都能解决
// (1) 用已知变量生成新的变量 
generate lny = log(评价量)  
generate price_square = 团购价元 ^2
generate interaction_term = 团购价元*商品毛重kg

// (2) 修改变量名称，因为用中文命名变量名称有时候可能容易出现未知Bug
rename 团购价元 price

// 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
// 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
// 视频中提到的附件可在售后群（购买后收到的那个有道云笔记中有加入方式）的群文件中下载。包括讲义、代码、优秀的作业、我视频中推荐的资料等。
// 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
// 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
// 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
// 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）
