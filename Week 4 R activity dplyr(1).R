#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
HairEyeColor
NewhairEyeColor <- data.frame(HairEyeColor)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(NewhairEyeColor, 1)


#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library("dplyr")

#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
select(NewhairEyeColor, c(Hair, Sex))


#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as a new dataset
#and give it a name
Hair_and_Sex <- NewhairEyeColor[, c("Hair", "Sex")]

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
select(Hair_and_Sex, -c(Sex))

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
rename(Hair_and_Sex, gender = Sex)
rename(NewhairEyeColor, gender = Sex)

#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
#Hair_and_gender <- Hair_and_Sex[, c("Hair", "Sex")]
#names(Hair_and_gender) <- c("Hair", "gender")

NewhairEyeColor2 <- NewhairEyeColor[, c("Hair", "Eye", "Sex", "Freq")]
names(NewhairEyeColor2) <- c("Hair", "Eye", "gender", "Freq")

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
Male_filtered <- filter(NewhairEyeColor2, gender == "Male")

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
group_by(NewhairEyeColor2, gender)

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#After you run it, write the total here: '592'
total=mutate(NewhairEyeColor2, total=cumsum(Freq))

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
Female_filtered <- filter(NewhairEyeColor2, gender == "Female")


#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
union(Male_filtered, Female_filtered)
bind_rows(Male_filtered, Female_filtered)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
#Use of the Arrange Function
arrange(NewhairEyeColor2, gender)
arrange(NewhairEyeColor2, Eye)
arrange(NewhairEyeColor2, Hair)

#Use of Slice Function
slice(NewhairEyeColor2, -(1))
slice(NewhairEyeColor2, (1:5))

