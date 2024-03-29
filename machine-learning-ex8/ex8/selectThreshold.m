function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions
    %[wrong code] no need compute pval(vectorizationnnnn for suuuuure)
    %load('ex8data1.mat');
    %[mu sigma2] = estimateGaussian(Xval);
    %pval = 1/sqrt(2*pi*sigma2.^2)*exp(-((Xval - mu').^2)'/(2*sigma2.^2));
    
    %([wrong code]no need)cvPredictions = zeros(n,1);
    %if pval(i) < epsilon then cvPredictions(i) = 1
    cvPredictions = (pval < epsilon);
    %compute cp fp fn by comparing cvPredictions with ground
    %truth(yval)
    tp = sum((cvPredictions == 1) & (yval == 1));
    fp = sum((cvPredictions == 1) & (yval == 0));
    fn = sum((cvPredictions == 0) & (yval == 1));
    %compute presion and recall
    prec = tp / (tp + fp);
    rec = tp / (tp + fn);
    %compute F1 to decide tht best epsilon(largest F1 wins)
    F1 =(2 * prec * rec) / (prec + rec);
    if bestF1 < F1
        bestF1 = F1;
        bestEpsilon = epsilon;
    end
    












    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
