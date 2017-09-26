#!/bin/bash
# 定时清楚elk索引，30天
DATE=`date -d "30 days ago" +%Y.%m.%d`
curl -XGET 'http://127.0.0.1:9200/_cat/indices/?v'
curl -XDELETE 'http://127.0.0.1:9200/*-$DATE'
