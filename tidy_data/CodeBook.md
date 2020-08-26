# Code Book: Getting and Cleaning Data

The measurements selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals timeAccelerometer-XYZ and timeGyroscope-XYZ. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerMagnitude, timeGravityAccelerometerMagnitude, timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkMagtude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccelerometer-XYZ, frequencyBodyAccelerometerJerk-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAccelerometerJerkMagnitude, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMag. (Note the 'frequency' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

All accelerometer values are measured in standard gravity (*g*) and all gyroscope measurements are in radians per second. The calculated jerk values are time derivative and so are in standard gravity per second and radians per second per second.

The set of variables that were estimated from these signals are: 

* _mean_: Mean value
* _standardDeviation_: Standard deviation

Descriptor variables include: 
* _subject_ - Identifies the subject of the measurement using an integer between 1 and 30.
* _activity_ - Activity descriptor being one of:
  * standing          
  * sitting           
  * laying            
  * walking           
  * walking_downstairs
  * walking_upstairs
  
All variable names:
  * subject
  * activity
  * timeBodyAccelerometer-mean-X
  * timeBodyAccelerometer-mean-Y
  * timeBodyAccelerometer-mean-Z
  * timeGravityAccelerometer-mean-X
  * timeGravityAccelerometer-mean-Y
  * timeGravityAccelerometer-mean-Z
  * timeBodyAccelerometerJerk-mean-X
  * timeBodyAccelerometerJerk-mean-Y
  * timeBodyAccelerometerJerk-mean-Z
  * timeBodyGyroscope-mean-X
  * timeBodyGyroscope-mean-Y
  * timeBodyGyroscope-mean-Z
  * timeBodyGyroscopeJerk-mean-X
  * timeBodyGyroscopeJerk-mean-Y
  * timeBodyGyroscopeJerk-mean-Z
  * timeBodyAccelerometerMagnitude-mean
  * timeGravityAccelerometerMagnitude-mean
  * timeBodyAccelerometerJerkMagnitude-mean
  * timeBodyGyroscopeMagnitude-mean
  * timeBodyGyroscopeJerkMagnitude-mean
  * frequencyBodyAccelerometer-mean-X
  * frequencyBodyAccelerometer-mean-Y
  * frequencyBodyAccelerometer-mean-Z
  * frequencyBodyAccelerometerJerk-mean-X
  * frequencyBodyAccelerometerJerk-mean-Y
  * frequencyBodyAccelerometerJerk-mean-Z
  * frequencyBodyGyroscope-mean-X
  * frequencyBodyGyroscope-mean-Y
  * frequencyBodyGyroscope-mean-Z
  * frequencyBodyAccelerometerMagnitude-mean
  * frequencyBodyAccelerometerJerkMagnitude-mean
  * frequencyBodyGyroscopeMagnitude-mean
  * frequencyBodyGyroscopeJerkMagnitude-mean
  * timeBodyAccelerometer-standardDeviation-X
  * timeBodyAccelerometer-standardDeviation-Y
  * timeBodyAccelerometer-standardDeviation-Z
  * timeGravityAccelerometer-standardDeviation-X
  * timeGravityAccelerometer-standardDeviation-Y
  * timeGravityAccelerometer-standardDeviation-Z
  * timeBodyAccelerometerJerk-standardDeviation-X
  * timeBodyAccelerometerJerk-standardDeviation-Y
  * timeBodyAccelerometerJerk-standardDeviation-Z
  * timeBodyGyroscope-standardDeviation-X
  * timeBodyGyroscope-standardDeviation-Y
  * timeBodyGyroscope-standardDeviation-Z
  * timeBodyGyroscopeJerk-standardDeviation-X
  * timeBodyGyroscopeJerk-standardDeviation-Y
  * timeBodyGyroscopeJerk-standardDeviation-Z
  * timeBodyAccelerometerMagnitude-standardDeviation
  * timeGravityAccelerometerMagnitude-standardDeviation
  * timeBodyAccelerometerJerkMagnitude-standardDeviation
  * timeBodyGyroscopeMagnitude-standardDeviation
  * timeBodyGyroscopeJerkMagnitude-standardDeviation
  * frequencyBodyAccelerometer-standardDeviation-X
  * frequencyBodyAccelerometer-standardDeviation-Y
  * frequencyBodyAccelerometer-standardDeviation-Z
  * frequencyBodyAccelerometerJerk-standardDeviation-X
  * frequencyBodyAccelerometerJerk-standardDeviation-Y
  * frequencyBodyAccelerometerJerk-standardDeviation-Z
  * frequencyBodyGyroscope-standardDeviation-X
  * frequencyBodyGyroscope-standardDeviation-Y
  * frequencyBodyGyroscope-standardDeviation-Z
  * frequencyBodyAccelerometerMagnitude-standardDeviation
  * frequencyBodyAccelerometerJerkMagnitude-standardDeviation
  * frequencyBodyGyroscopeMagnitude-standardDeviation
  * frequencyBodyGyroscopeJerkMagnitude-standardDeviation
