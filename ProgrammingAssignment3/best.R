best <- function(state, outcome) { 
   
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
   
   return (hospitals[1,2])
   
   
}