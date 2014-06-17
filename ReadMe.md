## File Description
- run_analysis.R: a R script to get a tidy dataset from [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)。
- CodeBook.md: a code book describes the columns in `total.txt`
- simple.txt:a text file which be simplied from `total.txt`，which with the average of each variable for each activity and each subject 
- ReadMe.md: this file.

More information with the dataset can be get from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Run the Script
1. Download the data from [here](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/)
2. To Run the Script, we must set up the right path to the files in line 2~8 in the `run_analysis.R`:
```
xtrainpath = 'train/X_train.txt';
ytrainpath = 'train/y_train.txt';
xtestpath = 'test/X_test.txt';
ytestpath = 'test/y_test.txt';
featurespath = 'features.txt';
actlabelspath = 'activity_labels.txt';
```
3. After running the `run_analysis.R` sucessfully, it will generate two text file named `total.txt` and `simple.txt`.

4. Now we can follow the description in `CodeBook.md` and use the tidy data in the two text file.