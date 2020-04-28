quiz_data <- read.csv("hw1_data.csv")
quiz_data

#Col Names
colnames(quiz_data)

#Extract first 2 rows of the data
quiz_data[1:2,]

#Number of Observations
nrow(quiz_data)

#Extract last 2 rows of the data
tail(quiz_data,2)

#Value of Ozone in the 47th row
quiz_data$Ozone[47]

#Number of missing values in the Ozone col
Ozone_col = quiz_data$Ozone
Ozone_col
sum(is.na(Ozone_col))

#Mean of the Ozone values excluding NA
Is_NA = is.na(Ozone_col)
Ozone_col_no_NA = Ozone_col[!Is_NA]
Ozone_col_no_NA
mean(Ozone_col_no_NA)

#Extract the subset of rows of the data frame where Ozone values are above 31 
#and Temp values are above 90. What is the mean of Solar.R in this subset?
Ozone_above31 <- quiz_data[quiz_data$Ozone>31, , drop = FALSE]
Ozone_above31
Temp_above90 <- Ozone_above31[Ozone_above31$Temp>90, , drop = FALSE]
Temp_above90
Wanted_rows <- na.omit(Temp_above90)
Wanted_rows
mean(Wanted_rows$Solar.R)

#Mean of Temp when Month is equal to 6
June_data <- quiz_data[quiz_data$Month == 6, , drop = FALSE]
mean(June_data$Temp)

#Max Ozone in May
May_data <- quiz_data[quiz_data$Month == 5, , drop = FALSE]
May_data_Ozone <- May_data$Ozone
May_data_Ozone
tf <- is.na(May_data_Ozone)
May_data_Ozone_no_NA <- May_data_Ozone[!tf]
max(May_data_Ozone_no_NA)
