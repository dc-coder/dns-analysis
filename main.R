setwd("/Users/mireilleraad/R/DNS/data-sample")

 # Get the files names

rbind.all.columns <- function(x, y) {
  
  x.diff <- setdiff(colnames(x), colnames(y))
  y.diff <- setdiff(colnames(y), colnames(x))
  
  x[, c(as.character(y.diff))] <- NA
  
  y[, c(as.character(x.diff))] <- NA
  
  return(rbind(x, y))
}


files = list.files(pattern="*.csv.gz")
 # First apply read.csv, then rbind
merged_data = do.call(rbind, lapply(files, function(x) read.csv(x, stringsAsFactors = FALSE)[ ,1:10]))
  
nrow(merged_data)
   
 
 
 
 