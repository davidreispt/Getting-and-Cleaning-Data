##################################
# run_analysis.R 
##################################

tabAllData - Contains all the train and test measures of STD (Standard Deviation) and Mean from the original dataset. With the activity information on the first column.

resultDF - returns the means of all metrics of table tabAllData by activity and subject 
	
##################################
# tabAllData - Details
##################################

PROCCESS

1 Load all Dataset activities and features from files
2 Create map of selected measures (std and mean)
3 Filter datasets just for those measures
4 Join activity information to the dataset
5 Merge both train and test dataset

COLUMN INFORMATION

Activity - is a string which describe the action of the human user

Activities (column 1)
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

All metrics from 2 to 67 have numeric values

mean(): Mean value
std(): Standard deviation

1	Activity
2	tBodyAcc-mean()-X
3	tBodyAcc-mean()-Y
4	tBodyAcc-mean()-Z
5	tBodyAcc-std()-X
6	tBodyAcc-std()-Y
7	tBodyAcc-std()-Z
8	tGravityAcc-mean()-X
9	tGravityAcc-mean()-Y
10	tGravityAcc-mean()-Z
11	tGravityAcc-std()-X
12	tGravityAcc-std()-Y
13	tGravityAcc-std()-Z
14	tBodyAccJerk-mean()-X
15	tBodyAccJerk-mean()-Y
16	tBodyAccJerk-mean()-Z
17	tBodyAccJerk-std()-X
18	tBodyAccJerk-std()-Y
19	tBodyAccJerk-std()-Z
20	tBodyGyro-mean()-X
21	tBodyGyro-mean()-Y
22	tBodyGyro-mean()-Z
23	tBodyGyro-std()-X
24	tBodyGyro-std()-Y
25	tBodyGyro-std()-Z
26	tBodyGyroJerk-mean()-X
27	tBodyGyroJerk-mean()-Y
28	tBodyGyroJerk-mean()-Z
29	tBodyGyroJerk-std()-X
30	tBodyGyroJerk-std()-Y
31	tBodyGyroJerk-std()-Z
32	tBodyAccMag-mean()
33	tBodyAccMag-std()
34	tGravityAccMag-mean()
35	tGravityAccMag-std()
36	tBodyAccJerkMag-mean()
37	tBodyAccJerkMag-std()
38	tBodyGyroMag-mean()
39	tBodyGyroMag-std()
40	tBodyGyroJerkMag-mean()
41	tBodyGyroJerkMag-std()
42	fBodyAcc-mean()-X
43	fBodyAcc-mean()-Y
44	fBodyAcc-mean()-Z
45	fBodyAcc-std()-X
46	fBodyAcc-std()-Y
47	fBodyAcc-std()-Z
48	fBodyAccJerk-mean()-X
49	fBodyAccJerk-mean()-Y
50	fBodyAccJerk-mean()-Z
51	fBodyAccJerk-std()-X
52	fBodyAccJerk-std()-Y
53	fBodyAccJerk-std()-Z
54	fBodyGyro-mean()-X
55	fBodyGyro-mean()-Y
56	fBodyGyro-mean()-Z
57	fBodyGyro-std()-X
58	fBodyGyro-std()-Y
59	fBodyGyro-std()-Z
60	fBodyAccMag-mean()
61	fBodyAccMag-std()
62	fBodyBodyAccJerkMag-mean()
63	fBodyBodyAccJerkMag-std()
64	fBodyBodyGyroMag-mean()
65	fBodyBodyGyroMag-std()
66	fBodyBodyGyroJerkMag-mean()
67	fBodyBodyGyroJerkMag-std()


##################################
# resultDF - Details
##################################

PROCCESS

1 Add Subject data to tabAllData dataset
2 Loop unique Activity and Subject grouped by the temporary dataset tabAllDataWSubject to get mean for each column and generate a new dataset resultDF
3 Write file cleaning_result.txt with the results

COLUMN INFORMATION

Subject - is an number that represent the human user.
Activity - is a string which describe the action of the human user

1	Subject
2	Activity	
3	tBodyAcc-mean()-X
4	tBodyAcc-mean()-Y
5	tBodyAcc-mean()-Z
6	tBodyAcc-std()-X
7	tBodyAcc-std()-Y
8	tBodyAcc-std()-Z
9	tGravityAcc-mean()-X
10	tGravityAcc-mean()-Y
11	tGravityAcc-mean()-Z
12	tGravityAcc-std()-X
13	tGravityAcc-std()-Y
14	tGravityAcc-std()-Z
15	tBodyAccJerk-mean()-X
16	tBodyAccJerk-mean()-Y
17	tBodyAccJerk-mean()-Z
18	tBodyAccJerk-std()-X
19	tBodyAccJerk-std()-Y
20	tBodyAccJerk-std()-Z
21	tBodyGyro-mean()-X
22	tBodyGyro-mean()-Y
23	tBodyGyro-mean()-Z
24	tBodyGyro-std()-X
25	tBodyGyro-std()-Y
26	tBodyGyro-std()-Z
27	tBodyGyroJerk-mean()-X
28	tBodyGyroJerk-mean()-Y
29	tBodyGyroJerk-mean()-Z
30	tBodyGyroJerk-std()-X
31	tBodyGyroJerk-std()-Y
32	tBodyGyroJerk-std()-Z
33	tBodyAccMag-mean()
34	tBodyAccMag-std()
35	tGravityAccMag-mean()
36	tGravityAccMag-std()
37	tBodyAccJerkMag-mean()
38	tBodyAccJerkMag-std()
39	tBodyGyroMag-mean()
40	tBodyGyroMag-std()
41	tBodyGyroJerkMag-mean()
42	tBodyGyroJerkMag-std()
43	fBodyAcc-mean()-X
44	fBodyAcc-mean()-Y
45	fBodyAcc-mean()-Z
46	fBodyAcc-std()-X
47	fBodyAcc-std()-Y
48	fBodyAcc-std()-Z
49	fBodyAccJerk-mean()-X
50	fBodyAccJerk-mean()-Y
51	fBodyAccJerk-mean()-Z
52	fBodyAccJerk-std()-X
53	fBodyAccJerk-std()-Y
54	fBodyAccJerk-std()-Z
55	fBodyGyro-mean()-X
56	fBodyGyro-mean()-Y
57	fBodyGyro-mean()-Z
58	fBodyGyro-std()-X
59	fBodyGyro-std()-Y
60	fBodyGyro-std()-Z
61	fBodyAccMag-mean()
62	fBodyAccMag-std()
63	fBodyBodyAccJerkMag-mean()
64	fBodyBodyAccJerkMag-std()
65	fBodyBodyGyroMag-mean()
66	fBodyBodyGyroMag-std()
67	fBodyBodyGyroJerkMag-mean()
68	fBodyBodyGyroJerkMag-std()


