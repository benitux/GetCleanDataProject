# UCI HAR DataSet Analysis CodeBook


* SubjectID

  Contains an integer value specifying the phone's user.

* Activity

  Contains the description of the activity performed by the user during the measurements. Can be one of:

  + WALKING
  + WALKING_UPSTAIRS
  + WALKING_DOWNSTAIRS
  + SITTING
  + STANDING
  + LAYING

* Measurement Variables

  These variables in the form of *variable_aggregateFunction* or *variable_aggregateFunction_axis* refers to:

  + *variable*: a signal as specified in the original CodeBook (*features_info.txt*)
  + *aggregateFuncion*: the mean or std functions already apllied in the original dataset.
  + *axis*: the axis corresponding to the X, Y or Z directions in which the signal was measured. 

  The *samsung* data frame variable contains the 10299 observations produced from concatenating the train and test datasets. 

  The *samsung_means* data frame and *submission.txt* file contains the means of these observations grouped by *SubjectID* and *Activity*.

