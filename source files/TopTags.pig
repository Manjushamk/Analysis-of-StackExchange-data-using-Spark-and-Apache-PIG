loadTag = LOAD 's3://adithya1894/Data/TopTags.csv' USING PigStorage(',');

limitData = LIMIT loadTag 100;

answer = FOREACH limitData GENERATE $0, $1, $2;

store answer INTO 's3://adithya1894/output5/' USING PigStorage (',');