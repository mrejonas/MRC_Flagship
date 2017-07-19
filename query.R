#library(redcapAPI)
library(REDCapR)
#library(shiny)
library(ggbiplot)

#REDCap connection
uri <- "https://redcap.h3abionet.org/redcap/redcap_v6.13.3/API/"
token <- "374394C291BDA405376F9317323D8367"

redcap <- redcap_read(redcap_uri = uri, token = token)$data

h <- ggplot(oxygen, aes(redcap_event_name, co2_ppm))
#jitter plot
h + geom_jitter() + theme(axis.text.x=element_text(angle=-90,hjust = 1))
# bar graph 
h + geom_bar(stat = "identity") + theme(axis.text.x=element_text(angle=-90,hjust = 1))

g <- ggplot(oxygen, aes(redcap_event_name))
g + geom_density(aes(fill=redcap_event_name))+theme(axis.text.x=element_text(angle=-90,hjust = 1)) + xlab("Patient ID")
