loadTag = LOAD 's3://adithya1894/Data/Valuable_Users.csv' USING PigStorage(',');

limitData = LIMIT loadTag 100;

store limitData INTO 's3://adithya1894/output6/' USING PigStorage (',');