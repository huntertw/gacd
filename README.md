==================================================================
Code Explanation
==================================================================

This R code is for a specific data set with a specific tidy output. It starts by loading the appropriate libraries (plyr and dplyr), which should be installed prior to running. 

It then creates 6 individual tables from the original Samsung dataset provided at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Using these 6 objects, one large table is created that combines all of the elements, including the activities, subjects, and measurement for the training and test sets. The label for training and test set was not saved because this is an entirely arbitrary assignment used for machine learning algorithms. There was no need to save it.

From this larger set, a subset is created that only includes variables that represent either a mean or a standard deviation. I included any variable that had "mean" or "std" in the name because I had no reason not to. Some of these are debatable, but stripping them out is much easier than bringing them back in.

In the next section, the replace function assigns more readable activity labels rather than 1-6 in the original set. In the same way, the variables are given more descriptive names that fit R's naming requirements. Each of these is explained below in the code book.

Finally, the code creates a wide data set that represent the average of each column by groupings of activity and subject. That is, for each activity (6 activities) that subject 1 (out of 30 subjects) performed, the code calculates a mean for each variable (86). The output, meanTidySet, is a wide tidy set.





==================================================================
Study Design, from the original data set's associated README (scroll down for the code book regarding this data set)
==================================================================

Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.






==================================================================
Code Book, again adapted from the original information provided with the data set
==================================================================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Included in the tidy data set were only those variables that included mean or std as part of the name. Specifically, that included the following variables:

1 tBodyAcc-mean()-X

2 tBodyAcc-mean()-Y

3 tBodyAcc-mean()-Z

4 tBodyAcc-std()-X

5 tBodyAcc-std()-Y

6 tBodyAcc-std()-Z

41 tGravityAcc-mean()-X

42 tGravityAcc-mean()-Y

43 tGravityAcc-mean()-Z

44 tGravityAcc-std()-X

45 tGravityAcc-std()-Y

46 tGravityAcc-std()-Z

81 tBodyAccJerk-mean()-X

82 tBodyAccJerk-mean()-Y

83 tBodyAccJerk-mean()-Z

84 tBodyAccJerk-std()-X

85 tBodyAccJerk-std()-Y

86 tBodyAccJerk-std()-Z

121 tBodyGyro-mean()-X

122 tBodyGyro-mean()-Y

123 tBodyGyro-mean()-Z

124 tBodyGyro-std()-X

125 tBodyGyro-std()-Y

126 tBodyGyro-std()-Z

161 tBodyGyroJerk-mean()-X

162 tBodyGyroJerk-mean()-Y

163 tBodyGyroJerk-mean()-Z

164 tBodyGyroJerk-std()-X

165 tBodyGyroJerk-std()-Y

166 tBodyGyroJerk-std()-Z

201 tBodyAccMag-mean()

202 tBodyAccMag-std()

214 tGravityAccMag-mean()

215 tGravityAccMag-std()

227 tBodyAccJerkMag-mean()

228 tBodyAccJerkMag-std()

240 tBodyGyroMag-mean()

241 tBodyGyroMag-std()

253 tBodyGyroJerkMag-mean()

254 tBodyGyroJerkMag-std()

266 fBodyAcc-mean()-X

267 fBodyAcc-mean()-Y

268 fBodyAcc-mean()-Z

269 fBodyAcc-std()-X

270 fBodyAcc-std()-Y

271 fBodyAcc-std()-Z

294 fBodyAcc-meanFreq()-X

295 fBodyAcc-meanFreq()-Y

296 fBodyAcc-meanFreq()-Z

345 fBodyAccJerk-mean()-X

346 fBodyAccJerk-mean()-Y

347 fBodyAccJerk-mean()-Z

348 fBodyAccJerk-std()-X

349 fBodyAccJerk-std()-Y

350 fBodyAccJerk-std()-Z

373 fBodyAccJerk-meanFreq()-X

374 fBodyAccJerk-meanFreq()-Y

375 fBodyAccJerk-meanFreq()-Z

424 fBodyGyro-mean()-X

425 fBodyGyro-mean()-Y

426 fBodyGyro-mean()-Z

427 fBodyGyro-std()-X

428 fBodyGyro-std()-Y

429 fBodyGyro-std()-Z

452 fBodyGyro-meanFreq()-X

453 fBodyGyro-meanFreq()-Y

454 fBodyGyro-meanFreq()-Z

503 fBodyAccMag-mean()

504 fBodyAccMag-std()

513 fBodyAccMag-meanFreq()

516 fBodyBodyAccJerkMag-mean()

517 fBodyBodyAccJerkMag-std()

529 fBodyBodyGyroMag-mean()

530 fBodyBodyGyroMag-std()

539 fBodyBodyGyroMag-meanFreq()

542 fBodyBodyGyroJerkMag-mean()

543 fBodyBodyGyroJerkMag-std()

552 fBodyBodyGyroJerkMag-meanFreq()

556 angle(tBodyAccJerkMean),gravityMean)

557 angle(tBodyGyroMean,gravityMean)

558 angle(tBodyGyroJerkMean,gravityMean)

559 angle(X,gravityMean)

560 angle(Y,gravityMean)

561 angle(Z,gravityMean)
