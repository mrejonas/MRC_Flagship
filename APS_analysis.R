library(ggbiplot)
APS_data <- read.table(file="~mario/Development/REDCapAPI/output.csv", header=T, sep=",", encoding = "unknown")

h <- ggplot(APS_data, aes(x=redcap_event_name)) +geom_line(aes(y=co2_ppm, color="CO2")) + geom_line(aes(y=o2, color="O2"))  
#jitter plot
h + geom_jitter() + theme(axis.text.x=element_text(angle=-90,hjust = 1))
# bar graph 
h + geom_bar(stat = "identity") + theme(axis.text.x=element_text(angle=-90,hjust = 1))

g <- ggplot(oxygen, aes(redcap_event_name))
g + geom_density(aes(fill=redcap_event_name))+theme(axis.text.x=element_text(angle=-90,hjust = 1)) + xlab("Patient ID")
