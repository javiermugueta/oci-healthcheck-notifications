#!/bin/bash
# jmu 13/Jan/2020
PROBEID=$1
TOPIC=$2
LIMIT=$3
MESSAGE="OCI healthchechs monitor, there are healthchecks in red, that is failed"
QUERY='data[?"is-healthy"!=`true`]."probe-configuration-id"'
DATE=`date`
COMMAND="oci health-checks http-probe-result list --probe-configuration-id $PROBEID --query $QUERY --limit $LIMIT"
RESULT=($COMMAND)
echo $RESULT
if [[ $RESULT != '' ]]; then
    echo "KO"
    oci ons message publish --topic-id $2 --body "{date: $DATE, msg: $MESSAGE}"
else
    echo "OK"
fi