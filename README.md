# oci-healthcheck-notifications

#purpose
OCI healthchecks are monitors executed periodically to check the availability of an endpoint
<br>
This artifact queries the last n checks performed and generates a notification in case there exist
<br>
al least one healthched that failed

#usage
```
./ohcm <ocid-of-the-healthcheck> <ocid-of-the-notification-topic>

example:
./ohcm.sh ocid1.httpmonitor.oc1..aaaaaaaaj2iqjhpvzpj5ombf5h5ljmgswches5u7tbvwfsbo53aznk4jqonq ocid1.onstopic.oc1.eu-frankfurt-1.aaaaaaaay3wiv3q6nsvkupbymomccf4dkegzbszyb7c362uoawdywqkr3wta
```

#applications
Executited periodically from anywhere will send notifications when healthcheks are in "red"
