


#step1
#=========
#reading the file but the file isnot csv it is excel
df<-read_excel("C:/Users/farah/OneDrive/Desktop/zeta.xlsx")

#record the coloumn names
names(df)

#viewing the dimenstion of the dataframe
dim(df)
#no of rows
dim(df)[1]

#duplicate?
dup<-duplicated(df)
if (any(dup))
{
  zeta_nodupes<-df[!dup, ]
}

#Check the data formatted
str(df)

#Clear all rows with missing values.
df<-na.omit(df)



#step 2
#============

#Load the text file of income data (zipIncome.txt) into R
zzzdf<-read.table("C:/Users/farah/OneDrive/Desktop/zipincome.txt",header = TRUE,sep = ",")

#Change the column names of your data frame 
#so that zcta becomes zipCode and meanhouseholdincome becomes income.
colnames(zzzdf)[1] <- "zipCode"
colnames(zzzdf)[2] <- "income"

#Analyze the summary of your data
summary(zzzdf)
#the mean of the data 
mean(zzzdf$income)
#the median of the income 
median(zzzdf$income)

#Plot a scatter plot of the data
plot(zzzdf$income)

#In order to omit outliers, create a subset of the data so that:
#$7,000 < income < $200,000

zzzdf<-subset(zzzdf, income > 7000 & income < 200000)
# the new mean= 48466.83
mean(zzzdf$income)



#step 3
#=========


#Create a simple box plot of your data. Be sure to add a title and label the axes.
#excluding sex column becouse it is not numeric
boxplot(df[, -which(names(df) == "sex")], col =rainbow(6),main="The Zeta Data",ylab="zeta box plot")

boxplot(zzzdf$income, col = "blue",main="The Zeta Data", ylab = "Income")

boxplot(zzzdf$income, col = "blue",main="The Zeta Data", ylab = "Income",log="y")
