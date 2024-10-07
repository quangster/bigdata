#!/bin/bash
i=1
while :
do
    hadoop jar ../libs/hadoop-streaming-3.4.0.jar -files mapper.py,reducer.py,centroids.txt -mapper mapper.py -reducer reducer.py -input /kmeans_data/dataset.txt -output /output-kmeans-py$i
    rm -f centroids1.txt
    hdfs dfs -get /output-kmeans-py$i/part-00000 centroids1.txt
    seeiftrue=`python3 reader.py`
	if [ $seeiftrue = 1 ]
    then
        rm centroids.txt
        hdfs dfs -get /output-kmeans-py$i/part-00000 centroids.txt
        break
    else
        rm centroids.txt
        hdfs dfs -get /output-kmeans-py$i/part-00000 centroids.txt
    fi
    i=$((i+1))
done