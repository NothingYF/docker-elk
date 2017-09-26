#!/bin/sh

REPO=nothingdocker
IMAGENAME=elk-beat
DOCKERNAME=${1:-demo}

docker rm -f $DOCKERNAME

docker run -d --restart=always --privileged --name $DOCKERNAME \
    -p 5601:5601 \
    -p 9200:9200 \
    -p 5044:5044 \
    -v /data/platform/elk/config/logstash:/etc/logstash/conf.d \
    -v /data/platform/elk/config/filebeat:/etc/filebeat \
    -v /data/platform/elk/data/elansticsearch:/var/lib/elasticsearch \
    -v /data/platform/elk/data/filebeat:/var/lib/filebeat\
    -v /data/platform/elk/tool:/data/tool \
    -v /data/platform/p1/config:/data/work \
  $REPO/$IMAGENAME

docker exec -it $DOCKERNAME bash
