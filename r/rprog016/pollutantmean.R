pollutantmean <- function(directory, pollutant1, id = 1:332) {
  
  if (identical(pollutant1,"sulfate") | identical(pollutant1,"nitrate")) {
    
    s <- 0
    for (i in id) {
      
      if (i>=1&i<=9)  fn <- paste("00",i,sep="")
      if (i>=10&i<=99) fn <- paste("0",i,sep="") 
      if (i>=100) fn = i
      
      filename <- paste(paste(paste("./", directory,sep=""),"/",sep=""),paste(fn,".csv",sep=""),sep="")
      print(filename)
      pollutant <- read.csv(filename) 
      
      if (identical(pollutant1,"sulfate")) {
        s <- s + mean(pollutant$sulfate,na.rm=TRUE) 
      }
      else {
        s <- s + mean(pollutant$nitrate,na.rm=TRUE)
      }
      
    } ## for
    
    l <- length(id)
    m <- s/l
    
    return (m)
  
  }
  
  return (-1)
  
}