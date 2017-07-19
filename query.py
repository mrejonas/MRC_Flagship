#!/usr/bin/env python
from requests import post
import redcap
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

TARDIS = '32D266627431ECD4D5E7C9433A6187F2'
TARDIS_H3A = '374394C291BDA405376F9317323D8367'
# attempting to direct to the https url fails
URL = 'http://localhost/redcap/redcap_v6.9.6/API/'
URL_H3A = 'https://redcap.h3abionet.org/redcap/redcap_v6.16.8/API/'

# "requests" commands
payload = {'token': TARDIS_H3A, 'format': 'json', 'content': 'metadata'}

# "redcap" commands
project = redcap.Project(URL_H3A, TARDIS_H3A)
all_data = project.export_records(format = 'csv')
print all_data

response = post(URL_H3A, data=payload)
data = response.json()

#print "This project has %d fields" % len(data)
#print "field_name (type) ---> field_label"
#print "---------------------------"
#for field in data:
#    print "%s (%s) ---> %s" % (field['field_name'], field['field_type'], field['field_label'])
#print
#print "Each record has the following keys: %s." % ', '.join(data[0].keys())
#print "But our metadata structure has the following fields: %s" % ', '.join(f['field_name'] for f in data)
#print response.status_code

200

#print project.arms
#print project.events
