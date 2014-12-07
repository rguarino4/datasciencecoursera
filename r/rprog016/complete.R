complete <- function(directory, id = 1:332) {
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  count = 0
  df <- data.frame()
  for (i in id) {
    
    count = count + 1
    
    if (i>=1&i<=9)  fn <- paste("00",i,sep="")
    if (i>=10&i<=99) fn <- paste("0",i,sep="") 
    if (i>=100) fn = i
    
    filename <- paste(paste(paste("./", directory,sep=""),"/",sep=""),paste(fn,".csv",sep=""),sep="")
    #print(filename)
    pollutant <- read.csv(filename) 
    
    nobs <- nrow(subset(pollutant,!is.na(sulfate)&!is.na(nitrate)))
    
    if (count==1)
      df <- data.frame(i, nobs)
    else {
      x <- c(i, nobs)
      df <- rbind(df,x)
    }
    
  }
  
  return (df)
  
}