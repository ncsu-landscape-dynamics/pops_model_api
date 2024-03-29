
json_output<- httr::GET(paste("https://pops-model.org/api/output/", 158, "/?format=json", sep = ""))
output <- httr::content(json_output)
post_code <- httr::POST(url = "https://pops-model.org/api/output/", body = output, encode = "json")
code <- httr::content(post_code)
output$run <- 1488

## run with management for parsing using SLF
case_study_id = "1"
bucket = "pops-production"
session_id = "1"
run_collection_id = "182"
run_id = "250"


## run with management for parsing using SLF PA
case_study_id = "4"
bucket = "pops-production"
session_id = "3"
run_collection_id = "221"
run_id = "296"

## run with management for parsing using WSR
case_study_id = "2"
session_id = "2"
run_collection_id = "220"
# run_id = "4"
run_id = "293"

modelapi(case_study_id, session_id, run_collection_id, run_id)


t <- config$infected_file
save_file = aws.s3::save_object(object = t, bucket = bucket, file = t, check_region = FALSE)
result = raster::stack(t)

save_object("s", object = t, bucket = 'pops-production')
s <- raster("H:/Shared drives/Data/Raster/Regional/SLF_100m/tree_of_heaven_100m.tif")
