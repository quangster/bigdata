#!/bin/bash

echo "Remove output directory if exists"
hdfs dfs -rm -r /output-nb-java
hdfs dfs -rm -r /output-nb-java-test

echo "Push input data to HDFS"
hdfs dfs -put iris.csv /

echo "Build the jar"
mvn clean package

echo "Naive Bayes Training Java Hadoop"
hadoop jar target/naive-bayes-java-hadoop-1.0.jar com.example.NaiveBayesTrainJob -D num_mappers="3" -D num_reducers="1" -D delimiter="," -D input="/iris.csv" -D output="/output-nb-java" -D continousVariables="1,2,3,4" -D targetVariable="5" -D numColumns="5"

echo "Naive Bayes Testing Java Hadoop"
hadoop jar target/naive-bayes-java-hadoop-1.0.jar com.example.NaiveBayesTestJob -D num_mappers="3" -D num_reducers="1" -D delimiter="," -D input="/iris.csv" -D output="/output-nb-java-test" -D continousVariables="1,2,3,4" -D discreteVariables="" -D targetVariable="5" -D numColumns="5" -D modelPath="/output-nb-java" -D targetClasses="Iris-versicolor,Iris-setosa,Iris-virginica" 

echo "Train results"
hdfs dfs -cat /output-nb-java/part-00000

echo "Test results"
hdfs dfs -cat /output-nb-java-test/part-00000
