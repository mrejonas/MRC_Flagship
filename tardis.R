library(REDCapR)
uri <- "https://redcap.h3abionet.org/redcap/redcap_v7.3.1/API/"
token <- "374394C291BDA405376F9317323D8367"
all_particles <- redcap_read(redcap_uri = uri, token = token)$data
my_interest <- c("sample_id" ,"redcap_event_name", "co2_ppm")
get_my_interest <- redcap_read(redcap_uri = uri, token = token, fields = my_interest)$data
patientdata <- (get_my_interest$redcap_event_name == "tdrs_001_kt_arm_1")
patient1 <- as.data.frame(get_my_interest[patientdata,])
plot(patient1$sample_id,patient1$co2_ppm, "l", ylab = "CO2 in ppm", xlab = "Reading Number", main = "TDRS001 CO2 Readings" )