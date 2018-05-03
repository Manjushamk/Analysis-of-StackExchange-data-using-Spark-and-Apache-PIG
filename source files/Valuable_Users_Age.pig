loadPosts = LOAD 's3://adithya1894/Data/Posts.csv' USING PigStorage(',') as (Id: int, PostTypeId: int, AcceptedAnswerId: int, ParentId: int, CreationDate: chararray, DeletionDate: chararray, Score: int, ViewCount: int, Body: chararray, OwnerUserId: int, OwnerDisplayName: chararray, LastEditorUserId: int, LastEditorDisplayName: chararray, LastEditDate: chararray, LastActivityDate: chararray, Title: chararray, Tags: chararray, AnswerCount: int, CommentCount: int, FavoriteCount: int, ClosedDate: chararray, CommunityOwnedDate: int);

filterData = FILTER loadPosts BY PostTypeId == 2;

grouped = group filterData BY (OwnerUserID);

answerCount1 = FOREACH grouped GENERATE group, COUNT(filterData.Posts);

loadUsers = LOAD 's3://adithya1894/Data/Posts.csv' USING PigStorage(',') as (Id: int, Reputation: int, CreationDate: chararray, DisplayName: chararray, LastAccessDate: chararray, WebsiteUrl: chararray, Location: chararray, AboutMe: chararray, Views: int, UpVotes: int, DownVotes: int, ProfileImageUrl: chararray, EmailHash: chararray, Age: int, AccountId: int, Comments: chararray);

filterUsers = FOREACH loadUsers GENERATE Id, DisplayName, Age;

groupedUsers = group loadUsers BY (DisplayName);

jointable = JOIN answerCount1 BY group, groupedUsers BY Id;

limit_Data = LIMIT joinTable 100;

store limit_Data INTO 's3://adithya1894/output6/' USING PigStorage (',');