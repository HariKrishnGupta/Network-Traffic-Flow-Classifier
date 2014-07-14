function [predicted_classes, posteriors] = naiveBayesClassify(vectors, priors, likelihoods)

    n_classes = size(priors, 1);
    n_vectors = size(vectors, 1);
    predicted_classes = zeros(n_vectors, 1);
    posteriors = zeros(n_vectors,1);
    n_features = size(vectors,2);
    temp =1;	
    for i=1:n_vectors
        maxVal =0;
        temp=1;finalClass=1;
        for k=1:n_classes
        	
        	temp=1;finalVal=1;
        	
        	for j=1:n_features
        		inputVal = vectors(i,j);
			featureVarianceValue = likelihoods(k,(j+n_features));
			featureMeanValue = likelihoods(k,j);
			x = 1/(2*3.14*sqrt(featureVarianceValue));
			y = exp((-((inputVal-featureMeanValue)^2))/(2*featureVarianceValue));
			post = x*y; 	
			temp = temp * post;
			finalVal = temp;
		endfor;
            
  	     	temp = priors(k);
        	x = temp * finalVal; 
        	if x>maxVal,
        		maxVal=x;
        		finalClass = k;
        	end
        	
        endfor;
        
        
        predicted_classes(i) = finalClass;
        posteriors(i,1) = maxVal;

    endfor;

endfunction
