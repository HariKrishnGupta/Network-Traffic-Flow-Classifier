function naiveBayesClassifier()

    timeVar = cputime;	

    % load data
    load abdln.matrix;
    load abdln_classes.matrix;

    number_of_classes = 3;

    % data set allotment
    trainingset_vectors = abdln(1:60,:);
    trainingset_classes = abdln_classes(1:60,:);
    crossvalset_vectors = abdln(61:80,:);
    crossvalset_classes = abdln_classes(61:80,:);

    % cross validation to determine good k
    likelihoods = zeros(number_of_classes, size(abdln, 2));
    priors = zeros(number_of_classes, 1);
    evidence = zeros(size(abdln,2), 1);
    accuracy = 0.0;
    k = 0.0;
    k_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
    for i=1:length(k_values)
        % train with k
        [c_likelihoods, c_priors] = naiveBayesTrain(trainingset_vectors, trainingset_classes, number_of_classes, k_values(i));
        % classify cross-val set
        [crossval_predicted_classes, crossval_posteriors] = naiveBayesClassify(crossvalset_vectors, c_priors, c_likelihoods);
        % check if k is better than the previous k
        c_accuracy = sum(crossval_predicted_classes == crossvalset_classes)/length(crossvalset_classes)*100.0;
        if c_accuracy>accuracy
            accuracy = c_accuracy;
            k = k_values(i);
            likelihoods = c_likelihoods;
            priors = c_priors;
        endif;
    endfor;
    printf("Selected k=%2.2f with cross-validation accuracy=%2.2f%%.\n",k, accuracy);

    % trainingset accuray
    [trainingset_predicted_classes, trainingset_posteriors] = naiveBayesClassify(trainingset_vectors, priors, likelihoods);
    accuracy = sum(trainingset_predicted_classes == trainingset_classes)/length(trainingset_classes)*100.0;
    printf("Accuracy on training-set=%2.2f%%\n", accuracy);

    %disp(likelihoods);
    %disp(priors);	

    %load input data

    load input_abdln.matrix;
    t = size(input_abdln,1);
    x = 1:t;
    % predict examples
    for i=1:t	
    	[examples_predicted_classes, examples_posteriors] = naiveBayesClassify(input_abdln(i,:), priors, likelihoods);
    	%disp(input1(i,:));
    	%printf("Predicted Class - %d\t%d\n", i,examples_predicted_classes(1));
    	x(i) = examples_predicted_classes(1);
    endfor;
	
	x = x';
	save output.matrix x;

	printf('Total cpu time: %f seconds\n', cputime-timeVar);

endfunction
