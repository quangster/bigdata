#!/bin/bash

echo "Remove output directory if exists"
hdfs dfs -rm -r /output-kmeans-java

echo "Push input data to HDFS"
hdfs dfs -put data-kmeans.txt /

echo "Build the jar"
mvn clean package

echo "KMeans Java Hadoop"
hadoop jar target/kmeans-java-hadoop-1.0.jar com.example.Main -D in=/data-kmeans.txt -D lines=30 -D out=/output-kmeans-java -D maxloop=10 -D thresh=0.0001 -D NumReduceTask=2 -D k=3
