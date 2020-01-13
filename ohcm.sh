#!/bin/bash
# jmu 13/Jan/2020
PROBEID=$1
TOPIC=$2
MESSAGE="OCI healthchechs monitor: There are healthchecks in red"
QUERY='data[?"is-healthy"!=`true`]."probe-configuration-id"'
LIMIT=555
DATE=`date`

COMMAND=`oci health-checks http-probe-result list --probe-configuration-id $PROBEID --query $QUERY --limit $LIMIT`

if [[ $COMMAND != 'Query returned empty result, no output to show' ]]; then
    echo "KO"
    oci ons message publish --topic-id $2 --body "{date: $DATE, msg: $MESSAGE}"
else
    echo "OK"
fi