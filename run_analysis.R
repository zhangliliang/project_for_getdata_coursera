# set up the path to train set, test set and 
# the text describes the features and labels
xtrainpath = 'train/X_train.txt';
ytrainpath = 'train/y_train.txt';
xtestpath = 'test/X_test.txt';
ytestpath = 'test/y_test.txt';
featurespath = 'features.txt';
actlabelspath = 'activity_labels.txt';

# read the train set and test set
xtrain = read.table(xtrainpath);
ytrain = read.table(ytrainpath);
xtest = read.table(xtestpath);
ytest = read.table(ytestpath);

# get the columns which measure the mean and standard deviation
# then combine the train set and test set as one data set
cols = c(1:6, 41:46, 81:86, 121:126, 
         161:166, 201, 202, 214, 215,
         227, 228, 240, 241, 253, 254,
         266:271, 345:350, 424:429,
         503, 504, 516, 517, 529, 530,
         542, 543);
xtotal= rbind(xtrain[,cols], xtest[,cols]);
ytotal= rbind(ytrain, ytest);

# Uses descriptive activity names to name the activities in the data set
actlabels = read.table(actlabelspath, stringsAsFactors=F);
ytotal[,1] = actlabels[ytotal[,1], 2];

# Appropriately labels the data set with descriptive variable names.
features = read.table(featurespath, stringsAsFactors=F);
features[cols, 2]
colnames(xtotal) = features[cols, 2];
colnames(ytotal) = "activity";

#merge the label and the measurement as a set
total = cbind(ytotal, xtotal);

# Creates a second, independent tidy data set
# with the average of each variable for each activity and each subject. 
simple=data.frame();
parts = split(total[2:67], total$activity);
for (i in c(1:66)){
   for (j in c(1:length(parts))){
     simple[j, i] = mean(parts[[j]][,i]);
   }
}
colnames(simple) = features[cols, 2];
simple=cbind(names(parts), simple);
names(simple)[1] = "acitivity";

# save the two data sets to disk
write.csv(total, "total.csv", row.names=F);
write.csv(simple, "simple.csv", row.names=F);

