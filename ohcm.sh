#!/bin/bash
# jmu 13/Jan/2020 new
# jmu 13/Jun/2020 improved
PROBEID=$1
TOPIC=$2
LIMIT=$3
MONITORDESCRIPTION=$4
MESSAGE="===================\nOCI healthchechs monitor\nThere are healthchecks in red, that is, failed, for $MONITORDESCRIPTION!!!\n===================\n"
QUERY='data[?"is-healthy"!=`true`]."probe-configuration-id"'
DATE=`date`
COMMAND="oci health-checks http-probe-result list --probe-configuration-id $PROBEID --query $QUERY --limit $LIMIT"
echo $COMMAND
RESULT=($COMMAND)
echo $RESULT
if [[ $RESULT != '' ]]; then
    echo "KO"
    oci ons message publish --topic-id $2 --body "{date: $DATE, msg: $MESSAGE}"
else
    echo "OK"
fi