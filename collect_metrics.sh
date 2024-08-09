#!/bin/bash
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
FILENAME="/metrics/metrics_$TIMESTAMP.txt"
NODE_IP=${NODE_IP}
curl http://$NODE_IP:30000/metrics > $FILENAME

