hospitals <- function(state, outcome) { 
   
   # First: loading data from outcome-of-care-measures.csv
   file <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",colClasses="character")
   
   # Second: Trying subsetting by state
   outcomeState <- subset(file, State==state)
   if (nrow(outcomeState)==0) { 
      stop("invalid state")
   }
   
   # Third: Choosing the right column to take according to outcome
   outcomeRateDiseaseColumnIndex = -1
   outcomeToLower <- tolower(outcome)
   if (identical(outcomeToLower,"heart attack")) {
      outcomeRateDiseaseColumnIndex = 11
   }
   
   if (identical(outcomeToLower,"heart failure")) {
      outcomeRateDiseaseColumnIndex = 17
   }
   
   if (identical(outcomeToLower,"pneumonia")) {
      outcomeRateDiseaseColumnIndex = 23
   }
   
   if (outcomeRateDiseaseColumnIndex==-1) {
      stop("invalid outcome")
   }
   
   # Ordered by 30-day death rate AND by alphabetical Hospital Name(outcomeState[,2])
   hospitals <- outcomeState[order(as.numeric(outcomeState[,outcomeRateDiseaseColumnIndex]), outcomeState[,2]),]
   
   s <- subset(hospitals,subset = (as.numeric(hospitals[,outcomeRateDiseaseColumnIndex])>=0.0))
  
   return (s)
   
}

rankhospital <- function(state, outcome, num="best") {
   
   # Validation parameters(only rank, because state and outcome are validated in aux function hospitals defined above)
   if (is.numeric(num)&num<=0) {
      stop("invalid num.")
   }
   
   # This function is slightly modification of 'best' function. 
   # It returns ALL matrix of hospitals instead the name of the best one(lowest 30-day death rate)
   h <- hospitals(state,outcome)
   
   if (identical(num,"best")) {
      return (h[1,2])
   }
   
   if (identical(num,"worst")) {
      return (h[nrow(h),2])
   }
   
   if (num>nrow(h)) {
      return (NA)
   }
   
   return (h[num,2])
   
}


