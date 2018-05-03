loadTag = LOAD 's3://adithya1894/Data/Post.csv' USING PigStorage(',') as (Id: int, PostTypeId: int, AcceptedAnswerId: int, ParentId: int, CreationDate: chararray, DeletionDate: chararray, Score: int, ViewCount: int, Body: chararray, OwnerUserId: int, OwnerDisplayName: chararray, LastEditorUserId: int, LastEditorDisplayName: chararray, LastEditDate: chararray, LastActivityDate: chararray, Title: chararray, Tags: chararray, AnswerCount: int, CommentCount: int, FavoriteCount: int, ClosedDate: chararray, CommunityOwnedDate: int);

filterDataByPost = Filter loadTag BY PostTypeId == 1;


columns = FOREACH filterDataByPost GENERATE Id, Title, AnswerCount;

orderByDesc = ORDER columns BY DESC; 

limitData = LIMIT orderByDesc 100;

store limitData INTO 's3://adithya1894/output5/Max_answer_scores' USING PigStorage (',');