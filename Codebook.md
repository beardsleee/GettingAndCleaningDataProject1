==================================================================
### Getting and Cleaning Data Project 1 Dataset
Version 1.0
==================================================================
Using data from the project of the following principles:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

# Please see the OriginalCodebook.txt to read about the source data from which this subset is derived.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 66-feature vector with time and frequency domain variables of the means and standard deviation only.
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

* 'Codebook.md' (this file)

* 'features_info.txt': Shows information about the variables used on the feature vector from the original project.

* 'FeaturesUsed.txt': List of the features used in this subset.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'all/X_all.txt': measured observations set.

* 'all/y_all.txt': activity data.

* 'all/subject_all.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The following transformation from the original dataset were performed:

* The training and test datasets were appended to create single complete datafiles
* The features that were determined to define mean() and std() of the observations were extracted from the dataset (see FeaturesUsed.txt)
* The subject and activity data columns were added to the dataset and the resulting data was written to the MeanStdDataset.txt file

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
