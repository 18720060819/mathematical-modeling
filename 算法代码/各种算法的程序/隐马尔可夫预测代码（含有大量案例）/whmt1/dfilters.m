function [h0, h1] = dfilters(fname, type)
% DFILTERS	Generate directional 2D filters
%
%	[h0, h1] = dfilters(fname, type)
%
% Input:
%   fname:	Filter name.  Available 'fname' are:
%       'haar':     the "Haar" filters
%       '5-3':      McClellan transformed of 5-3 filters
%       'cd','9-7': McClellan transformed of 9-7 filters (Cohen and Daubechies)
%       'pkvaN':   length N ladder filters by Phong et al. (N = 6, 8, 12)
%
%   type:	'd' or 'r' for decomposition or reconstruction filters
%
% Output:
%   h0, h1:	diamond filter pair (lowpass and highpass)

% To test those filters (for the PR condition for the FIR case), verify that:
% conv2(h0, modulate2(h1, 'b')) + conv2(modulate2(h0, 'b'), h1) = 2
% (replace + with - for even size filters)
%
% To test for orthogonal filter
% conv2(h, reverse2(h)) + modulate2(conv2(h, reverse2(h)), 'b') = 2

% The diamond-shaped filter pair
switch fname
    case {'haar'}
        if lower(type(1)) == 'd'
            h0 = [1, 1] / sqrt(2);
            h1 = [-1, 1] / sqrt(2);
        else
            h0 = [1, 1] / sqrt(2);
            h1 = [1, -1] / sqrt(2);
        end
	
    case {'5-3', '5/3'}     % McClellan transformed of 5-3 filters
	    % 1D prototype filters: the '5-3' pair
	    [h0, g0] = pfilters('5-3');
	
	    if lower(type(1)) == 'd'
	        h1 = modulate2(g0, 'c');
	    else
	        h1 = modulate2(h0, 'c');
	        h0 = g0;
	    end

	    % Use McClellan to obtain 2D filters
	    t = [0, 1, 0; 1, 0, 1; 0, 1, 0] / 4;	% diamond kernel
	    h0 = mctrans(h0, t);		
	    h1 = mctrans(h1, t);
	
    case {'cd', '9-7', '9/7'}	    % by Cohen and Daubechies
	    % 1D prototype filters: the '9-7' pair
	    [h0, g0] = pfilters('9-7');
	
	    if lower(type(1)) == 'd'
	        h1 = modulate2(g0, 'c');
	    else
	        h1 = modulate2(h0, 'c');
	        h0 = g0;
	    end

	    % Use McClellan to obtain 2D filters
	    t = [0, 1, 0; 1, 0, 1; 0, 1, 0] / 4;	% diamond kernel
	    h0 = mctrans(h0, t);		
	    h1 = mctrans(h1, t);
	
    case {'pkva6', 'pkva8', 'pkva12', 'pkva'}	
        % Filters from the ladder structure
        
        % Allpass filter for the ladder structure network
        beta = ldfilter(fname);
        
        % Analysis filters
        [h0, h1] = ld2quin(beta);
        
        % Normalize norm
        h0 = sqrt(2) * h0;
        h1 = sqrt(2) * h1;
        
        % Synthesis filters
        if lower(type(1)) == 'r'
            f0 = modulate2(h1, 'b');
            f1 = modulate2(h0, 'b');
            
            h0 = f0;
            h1 = f1;
        end
	
    otherwise
        error('Unrecognized directional filter name');
        
end