
library(ggplot2)

# Read particle data exported from REDCap
APS_data <- read.table(file="~mario/Development/REDCapAPI/output.csv", header=T, sep=",", encoding = "unknown")
# Create total particle count from 0.583 to 4.068 micron (bacterial size)
APS_data$Total <- rowSums(APS_data[,20:49], na.rm = TRUE)
# Create total particle count across all particle sizes
APS_data$TotalAll <- rowSums(APS_data[,20:71], na.rm = TRUE)
# Plot each captured time point against CO2 count
ggplot(APS_data, aes(x=sample_id)) +geom_line(aes(y=co2_ppm, color=redcap_event_name))+ xlab("Sampling Timepoints") + ylab("Parts Per Million (ppm)") + ggtitle("CO2 Levels per patient")
# Plot each captured time point against total particle count
ggplot(APS_data, aes(x=sample_id)) +geom_line(aes(y=APS_data$TotalAll, color=redcap_event_name))+ xlab("Sampling Timepoints") + ylab("Total Particle count (ppm)")
# Plot each captured time point against summed particle count between 0.583 and 4.068
ggplot(APS_data, aes(x=sample_id)) +geom_line(aes(y=APS_data$Total, color=redcap_event_name))+ xlab("Sampling Timepoints") + ylab("Summed Particle count < 4.068um (ppm)")
