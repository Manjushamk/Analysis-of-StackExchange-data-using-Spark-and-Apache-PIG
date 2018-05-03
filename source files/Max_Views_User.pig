loadTag = LOAD 's3://adithya1894/Data/Max_Views.csv' USING PigStorage(',');

limitData = LIMIT loadTag 100;

answer = Foreach limitData Generate $0, $1, $2, $3, $4;

orderByDesc = ORDER answer BY $4

store orderByDesc INTO 's3://adithya1894/output6/' USING PigStorage (',');