## Hadoop Streaming Using Python - Word Count Problem

Changing the permission to read, write, execute 
```bash
chmod 777 mapper.py reducer.py
```

Test mapper
```bash
cat test.txt | python3 mapper.py
```

Test reducer
```bash
cat test.txt | python3 mapper.py | sort -k1,1 | python3 reducer.py
```

Prepare data, push to HDFS
```bash
hdfs dfs -put ../data/lenta_articles /lenta_articles
```

Perform Hadoop Streaming
```
hadoop jar ../libs/hadoop-streaming-3.4.0.jar -files mapper.py,reducer.py -mapper mapper.py -reducer reducer.py -input /lenta_articles -output /output-wc-py
```

Cat ouput
```bash
hdfs dfs -cat /output-wc-py/part-00000
```
