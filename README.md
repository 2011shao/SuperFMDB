# SuperFMDB
对 fmdb 的封装,真心记不住 sqlite 语句,全部汉化 一句话搞定所有!适合初学者,大牛请躲避!

第一步:请确保程序已经导入了 FMDB,没有导入的自己用 pod 导入最好

第二步:下载 superFmdb然后导入到程序里

第三步:导入头文件:SuperFMDB.h 就 okle 

第四步:ocmywant创建/删除/添加/更改/自定义/查询/就可以了



<程序思路>
程序本应如此: oc  我想要创建表,我告诉他位置,告诉表明,告诉表里有哪些东西,然后 oc 就帮我完成了!
我想要删除,更新,添加,查询等等,都可以一句话搞定!这个库也很简单,就是利用字符串和宏把 sqlite 语句给隐藏了,让你看不见,只写自己要写的就可以了! 这个只是封装文件,需要自己在下 fmdb 文件,导入到程序就可以了

#pragma mark---创建表
/**
 *指定地址没有数据库会自行创建
 *在filePath地址里创建数据库
 *tablename在filepath数据里创建表
 *tablecontent创建表的属性 (name text,age integer,sex text)
 */

+(void)OcMyWantCreatSqlAtPath:(NSString*)filePath creatTableWithTableName:(NSString*)tablename tablecontent:(NSString*)tablecontent;
#pragma mark---查询表功能
/**
 *查询名tabelname表的内容
 *在filePath地址里创建数据库
 *returnBlock返回查询的结果集,同解析json
 */

+(void)OcMyWantSelectSqlTableContentOfTablename:(NSString*)tablename atPath:(NSString*)filePath Inblock:(void(^)(FMResultSet *resultSet))returnBlock;

/**
 *查询名tabelname表里符合one或者two添加的内容
 *oneCondition=@"name=/>/<''" or TwoCondition
 *returnBlock返回查询的结果集,同解析json
 */

/*
 [SuperFMDB OcMyWantSelectSqlTableContentOfTablename:@"table1" myCondition:@"name='帅帅' and id>'8'" atPath:@"Documents/shaoshuai.sqlite" Inblock:^(FMResultSet *resultSet) {
 
 }];
 
 */
+(void)OcMyWantSelectSqlTableContentOfTablename:(NSString*)tablename myCondition:(NSString*)myCondition atPath:(NSString*)filePath Inblock:(void(^)(FMResultSet *resultSet))returnBlock;

/**
 *  全手写 sql 语句
 *
 */
+(void)OcMyWantSelectSqlite:(NSString*)sqlStr atPath:(NSString*)filePath Inblock:(void(^)(FMResultSet *resultSet))returnBlock;


#pragma mark---添加表元素功能
/**
 *为名为tablename的表添加元素
 *tablecontent(name,age,sex)
 *addcontent('帅帅',18,'男')
 */
+(BOOL)OcMyWantAddcontentToTableName:(NSString*)tablename AddTableContent:(NSString*)tablecontent AddContentOfSuperPeople:(NSString*)addcontent AtPath:(NSString*)filePath;

#pragma mark---删除表功能

/**
 *删除名为tablename的数据库里的表
 */

+(void)OcMyWantDelectTableName:(NSString*)tablename AtPath:(NSString*)filePath;

/**
 *删除名为tablename的数据库里符合自己设定要求的行
 *myCondition自己设定的要求
 */

/*
 [SuperFMDB OcMyWantDelectOftablename:@"table1" myCondition:@"id>'3' and id <'6'" AtPath:@"Documents/shaoshuai.sqlite"];
 
 */
+(void)OcMyWantDelectOftablename:(NSString*)tablename myCondition:(NSString*)myCondition AtPath:(NSString*)filePath;
/**
 *  清空表
 *
 */
+(void)OcMyWantQingkongOftablename:(NSString*)tablename AtPath:(NSString*)filePath;

#pragma mark---更新表数据功能

/**
 *更新名为tablename的表指定tableID行的内容
 */
+(void)OcMyWantUpdateTableContentOfTableId:(NSString*)tableId tablename:(NSString*)tablename tableUpDateContent:(NSString*)tableUpdateContent AtPath:(NSString*)filePath;

/**
 *更新名为tablename的表符合自己设定条件行的内容
 */
/*
 
 [SuperFMDB OcMyWantUpdateTableContentOfmyCondition:@"name='少帅' or sex='男'" tablename:@"table1" tableUpDateContent:@"name='帅帅'" AtPath:@"Documents/shaoshuai.sqlite"];
 
 
 */

+(void)OcMyWantUpdateTableContentOfmyCondition:(NSString*)myCondition tablename:(NSString*)tablename tableUpDateContent:(NSString*)tableUpdateContent AtPath:(NSString*)filePath;
#pragma mark---给表添加新的list
/*
 
 [SuperFMDB OcMyWantAddNewTableContentListofTableName:@"table1" newList:@"地址 text" AtPath:@"Documents/shaoshuai.sqlite"];
 
 */
+(void)OcMyWantAddNewTableContentListofTableName:(NSString *)tablename newList:(NSString *)newList AtPath:(NSString *)filePath;

