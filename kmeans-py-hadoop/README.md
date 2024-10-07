## Hadoop Streaming Using Python - K-Means

[MapReduce Algorithms for k-means Clustering](https://web.stanford.edu/~rezab/classes/cme323/S16/projects_reports/bodoia.pdf)

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

Push data to HDFS
```bash
hdfs dfs -put ../data/kmeans_data /kmeans_data
```

Perform Hadoop Streaming
```bash
bash run.sh
```