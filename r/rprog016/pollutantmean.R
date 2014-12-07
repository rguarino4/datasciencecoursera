pollutantmean <- function(directory, pollutant1, id = 1:332) {
  
  if (identical(pollutant1,"sulfate") | identical(pollutant1,"nitrate")) {
    
    s <- 0
    count = 0 
    m <- 0
    notna <- 0
    for (i in id) {
      
      count = count + 1
      
      if (i>=1&i<=9)  fn <- paste("00",i,sep="")
      if (i>=10&i<=99) fn <- paste("0",i,sep="") 
      if (i>=100) fn = i
      
      filename <- paste(paste(paste("./", directory,sep=""),"/",sep=""),paste(fn,".csv",sep=""),sep="")
      #print(filename)
      pollutant <- read.csv(filename) 
      size <- nrow(pollutant)
      
      for (j in 1:size) {
        if (identical(pollutant1,"sulfate")) {
          if (!is.na(pollutant$sulfate[j])) {
            s <- s + pollutant$sulfate[j]
            notna = notna + 1
          }
        }
        else {
          if (!is.na(pollutant$nitrate[j])) {
            s <- s + pollutant$nitrate[j] 
            notna = notna + 1
          }
        }
      }
      
    } ## for
    
    m <- s/notna
    
    
    return (m)
  
  }
  
  return (-1)
  
}