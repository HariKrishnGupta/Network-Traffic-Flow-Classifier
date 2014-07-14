function [likelihood_matrix, priors] = naiveBayesTrain(training_vectors, training_classes, n_classes, k)

    likelihood_matrix = zeros(n_classes, (size(training_vectors,2)*2));
    priors = zeros(n_classes, 1);
    #evidences = zeros(size(training_vectors,2), 1);

    for class=1:n_classes
        fm = training_vectors(find(training_classes == class), :);

        % calc and store likelihoods
        length = size(fm,2);
        rows = size(fm,1);
        meanValue = mean(fm);
        for j=1:length
        	meanVal = meanValue(j);
        	sumVal =0;
		for i=1:rows
			val = training_vectors(i,j);
			diffVal = val - meanVal;	
			diffVal = diffVal * diffVal;
			sumVal = sumVal + diffVal;
		endfor;
		varianceValue = sumVal/rows;
		likelihood_matrix(class,j) = meanVal;
		likelihood_matrix(class,(j+length)) = varianceValue;		
	endfor;
        % calc and store priors
        priors(class) = (size(fm,1) + k) / (size(training_vectors,1) + k*n_classes); % laplactian smoothing
    endfor;
	
endfunction
