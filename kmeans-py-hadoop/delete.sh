n=$1

for ((i=1; i<=n; i++))
do
    hdfs dfs -rm -r /output-kmeans-py$i
done