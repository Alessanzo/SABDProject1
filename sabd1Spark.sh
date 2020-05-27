#!/bin/sh -x

aws s3 cp s3://sabdbucket/SABDproject1-1.0-SNAPSHOT.jar .
aws s3 cp s3://sabdbucket/dpc-covid19-ita-andamento-nazionale.csv .
aws s3 cp s3://sabdbucket/time_series_covid19_confirmed_global.csv .
aws s3 cp s3://sabdbucket/countryContinent.csv .

hdfs dfs -mkdir sabddata
hdfs dfs -put dpc-covid19-ita-andamento-nazionale.csv ./sabddata/naz
hdfs dfs -put time_series_covid19_confirmed_global.csv ./sabddata/cov
hdfs dfs -put countryContinent.csv ./sabddata/coco
hdfs dfs -ls ./sabddata

spark-submit --class Query1 ./SABDproject1-1.0-SNAPSHOT.jar ./sabddata/naz query1output.csv true
cat query1output.csv
aws s3 cp ./query1output.csv s3://sabdbucket/query1output.csv

spark-submit --class Query2 ./SABDproject1-1.0-SNAPSHOT.jar ./sabddata/cov ./sabddata/coco query2output.csv true
cat query2output.csv
aws s3 cp ./query2output.csv s3://sabdbucket/query2output.csv
