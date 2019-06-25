#!/bin/bash

echo going to transfer $1 to the remote server and call it $2

sshpass -p $SAMPLE_PASSWORD scp -P 2222  $1 root@sandbox-hdp.hortonworks.com:~/$2

echo 'file was transfered, now going to add it hdfs'

sshpass -p $SAMPLE_PASSWORD ssh root@sandbox-hdp.hortonworks.com -p 2222 << EOF 

echo 'making the folder structure in hdfs';

hdfs dfs -mkdir -p  /tmp/script_transfer/;

echo 'adding data to hdfs....';

hdfs dfs -copyFromLocal -f ~/$2 /tmp/script_transfer/$2;

echo 'file has been added to hdfs';

echo 'starting transformation process...';

hdfs dfs -mkdir -p  /tmp/sparked_cleaned/;

python spark_transformation.py $2 ;

python generate_hive_script.py $2 ;

hdfs dfs -chmod -R 777 /tmp/sparked_cleaned/ ;

hive -f hive.sql ;

echo 'done uploading and cleaning data' ;
EOF

