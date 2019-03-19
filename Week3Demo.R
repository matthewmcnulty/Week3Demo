# vector containing column names
colnames <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")

# enter data into vectors before constructing
# the data frame

date_col <- c("2018-15-10", "2018-01-11", "2018-21-10", "2018-28-10", "2018-01-05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
# 99 is a value in the age col that I will
# need to recode
age_col <- c(32, 45, 25, 39, 99)
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
# NA is inserted in place of missing data
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2)
q5_col <- c(5, 5, 2, NA, 1)

# Construct a data frame using the data from all vectors above
managers <- data.frame(date_col, country_col,
                       gender_col, age_col, q1_col, 
                       q2_col, q3_col, q4_col, q5_col)

managers
str(managers)
head(managers, 10)

colnames(managers) <- colnames
# Recode incorrect age to NA
managers$Age[managers$Age == 99] <- NA
managers
# managers$Country[managers$Age == 39] <- NA
# managers

# Create new attribute called AgeCat and set values in AgeCat
# to the following if true
# >= 45 = Elderly
# >= 26 & <= 44 = Middle Aged
# <= 25 = Young

managers$AgeCat[managers$Age >= 45] <- "Elderly"
managers$AgeCat[managers$Age >= 26 & managers$Age <= 44] <- "Middle Aged"
managers$AgeCat[managers$Age <= 25] <- "Young"
managers$AgeCat[is.na(managers$Age)] <- "Elderly"
managers

# Create a new column called summary_col
# that contains a summary of each row

mean_values <- (c(managers$Q1, managers$Q2,
  managers$Q3, managers$Q4, managers$Q5))
mean_col <- mean(mean_values)

managers <- data.frame(managers, mean_col)
managers
?mean

