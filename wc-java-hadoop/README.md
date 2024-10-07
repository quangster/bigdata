# Word Count Problem with Hadoop MapReduce

Install dependencies, build jar
```bash
mvn clean package
```

Delete /output-wc-java folder in HDFS if exists
```bash
hdfs dfs -rm -r /output-wc-java
```

Run MapReduce
```bash
hadoop jar target/wc-java-hadoop-1.0.jar org.example.WordCountRunner /lenta_articles /output-wc-java
```

Output
```bash
hdfs dfs -cat /output-wc-java/part-00000
hdfs dfs -get /output-wc-java .
```
