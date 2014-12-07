corr <- function(directory, threshold = 0) {
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  ans <- c()
  for (i in 1:332) {
    
    df <- complete(directory,i)
    
    if (threshold==0) threshold = 1
    if (df$nobs>=threshold) {
      
      if (i>=1&i<=9)  fn <- paste("00",i,sep="")
      if (i>=10&i<=99) fn <- paste("0",i,sep="") 
      if (i>=100) fn = i
      
      filename <- paste(paste(paste("./", directory,sep=""),"/",sep=""),paste(fn,".csv",sep=""),sep="")
      #print(filename)
      pollutant <- read.csv(filename) 
      
      correlation <- cor(pollutant$nitrate,pollutant$sulfate,use="complete.obs")
      #print(correlation)
      
      ans <- c(ans,correlation)
      
    }   
     
  } # for
  
  return (ans)
  
}

