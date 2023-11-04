#! /bin/bash
echo running scap in lab-rh9-003
ssh student@lab-rh9-003 sudo oscap xccdf eval --fetch-remote-resources --profile xccdf_org.ssgproject.content_profile_ccn_intermediate --results-arf oscap-lab-rh9-003-report.xml  --report oscap-lab-rh9-003-report.html /usr/share/xml/scap/ssg/content/ssg-rhel9-ds.xml  

#echo running scap in lab-rh9-004
#ssh student@lab-rh9-004 sudo oscap xccdf eval --fetch-remote-resources --profile xccdf_org.ssgproject.content_profile_ccn_intermediate --results-arf oscap-lab-rh9-004-report.xml  --report oscap-lab-rh9-004-report.html /usr/share/xml/scap/ssg/content/ssg-rhel9-ds.xml  
