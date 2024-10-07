# Word Count Problem with Hadoop MapReduce

Install dependencies, build jar
```bash
mvn clean package
```

Run MapReduce
```bash
hadoop jar target/wc-java-hadoop-1.0.jar org.example.WordCountRunner /lenta_articles /output-wc-java
```

Cat output
```bash
hdfs dfs -cat /output-wc-java/part-00000
```