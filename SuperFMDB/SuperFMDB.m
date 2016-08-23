//
//  SuperFMDB.m
//
//  Created by mac on 14-10-12.
//  Copyright (c) 2014年 super-shuaishuai. All rights reserved.
//

#import "SuperFMDB.h"
@implementation SuperFMDB
//根据文件路径创建一个表:文件路径范例:"Documents/xx/xx.sqlite"
+(void)OcMyWantCreatSqlAtPath:(NSString*)filePath creatTableWithTableName:(NSString*)tablename tablecontent:(NSString*)tablecontent

{
    //创建表
    FMDatabase *_db =[SuperDB OcMyWantGetSqlFromAtPath:filePath];
    if (![_db open])
    {
        
        [_db close];
        return;
    }
    [_db setShouldCacheStatements:YES];
    if (![_db tableExists:tablename])//判断存不存在这个数据库,不存在创建
    {
        
        [_db executeUpdate:SQLTableContentWithTableName(tablename,tablecontent)];
        //NSLog(@"%@",SQLTableContentWithTableName(tablename,tablecontent));
       
    }
    [_db close];
}

#pragma mark---查询表功能

//查询数据库
+(void)OcMyWantSelectSqlTableContentOfTablename:(NSString*)tablename atPath:(NSString*)filePath Inblock:(void(^)(FMResultSet *resultSet))returnBlock
{
    
    {
        FMDatabase *_db =[SuperDB OcMyWantGetSqlFromAtPath:filePath];
        if (![_db open])
        {
            [_db close];
        }
        [_db setShouldCacheStatements:YES];
        
    NSString * biaoming=SQLSELECTTableContent(tablename);
        FMResultSet *rs =[_db executeQuery:biaoming];
        //把当前查询的这张表里面所有的东西返回到结果集上，如果有下一条,next==yes继续,如果当前这一条为最后一条，next==no
        BOOL i=NO;
        while ([rs next])
        {
            i=YES;
            returnBlock(rs);
            
        }
        if (i==NO) {
            returnBlock(nil);
        }
        [rs close];
        [_db close];
}
    
}
+(void)OcMyWantSelectSqlite:(NSString*)sqlStr atPath:(NSString*)filePath Inblock:(void(^)(FMResultSet *resultSet))returnBlock
{
    
    {
        FMDatabase *_db =[SuperDB OcMyWantGetSqlFromAtPath:filePath];
        if (![_db open])
        {
            [_db close];
        }
        [_db setShouldCacheStatements:YES];
        
        NSString * biaoming=sqlStr;
        FMResultSet *rs =[_db executeQuery:biaoming];
        //把当前查询的这张表里面所有的东西返回到结果集上，如果有下一条,next==yes继续,如果当前这一条为最后一条，next==no
        BOOL i=NO;
        while ([rs next])
        {
            i=YES;
            if (i) {
                returnBlock(rs);
                
            }
            
        }
        if (i==NO) {
            returnBlock(nil);
        }
        [rs close];
        [_db close];
    }
    
}
+(void)OcMyWantSelectSqlTableContentOfTablename:(NSString*)tablename myCondition:(NSString*)myCondition atPath:(NSString*)filePath Inblock:(void(^)(FMResultSet *resultSet))returnBlock
{
    
    {
        FMDatabase *_db =[SuperDB OcMyWantGetSqlFromAtPath:filePath];
        if (![_db open])
        {
            [_db close];
        }
        [_db setShouldCacheStatements:YES];
        
        NSString * biaoming=SQLSELECTTableContentOfmyCondition(tablename, myCondition);
        FMResultSet *rs =[_db executeQuery:biaoming];
        //把当前查询的这张表里面所有的东西返回到结果集上，如果有下一条,next==yes继续,如果当前这一条为最后一条，next==no
        BOOL i=NO;
        while ([rs next])
        {
            i=YES;
            if (i) {
                returnBlock(rs);

            }
            
        }
        if (i==NO) {
            returnBlock(nil);
        }
        [rs close];
        [_db close];
    }
    
}


#pragma mark---添加表元素功能
//加入数据库
+(BOOL)OcMyWantAddcontentToTableName:(NSString*)tablename AddTableContent:(NSString*)tablecontent AddContentOfSuperPeople:(NSString*)addcontent AtPath:(NSString*)filePath
{
    BOOL issucess=NO;
    FMDatabase *_db =[SuperDB OcMyWantGetSqlFromAtPath:filePath];
    if (![_db open])
    {
        [_db close];
        return issucess;
    }
    [_db setShouldCacheStatements:YES];
    if ([_db tableExists:tablename])
    {
       issucess=[_db executeUpdate:SQLADDTableContent(tablename,tablecontent,addcontent)];
   // NSLog(@"%@",SQLADDTableContent(tablename,tablecontent,addcontent));
        
        
    }
    [_db close];
    
    return issucess;
    
}

#pragma mark---添加删除表的功能

//删除数据库里名字为tablename的表
+(void)OcMyWantDelectTableName:(NSString*)tablename AtPath:(NSString*)filePath
{
    FMDatabase *_db =[SuperDB OcMyWantGetSqlFromAtPath:filePath];
    if (![_db open])
    {
        [_db close];
        return;
    }
    [_db setShouldCacheStatements:YES];
    if ([_db tableExists:tablename])
    {
        
        [_db executeUpdate:SQLDelectALL(tablename)];
    }
    [_db close];
    
    
    
}

//删除符合自己设定条件的行
+(void)OcMyWantDelectOftablename:(NSString*)tablename myCondition:(NSString*)myCondition AtPath:(NSString*)filePath
{
    FMDatabase *_db =[SuperDB OcMyWantGetSqlFromAtPath:filePath];
    if (![_db open])
    {
        [_db close];
        return;
    }
    [_db setShouldCacheStatements:YES];
    if ([_db tableExists:tablename])
    {
        
        [_db executeUpdate:SQLDelectmyConditionOfmyCondition(tablename,myCondition)];
            }
    [_db close];
    
}
//删除符合自己设定条件的行
+(void)OcMyWantQingkongOftablename:(NSString*)tablename AtPath:(NSString*)filePath
{
    FMDatabase *_db =[SuperDB OcMyWantGetSqlFromAtPath:filePath];
    if (![_db open])
    {
        [_db close];
        return;
    }
    [_db setShouldCacheStatements:YES];
    if ([_db tableExists:tablename])
    {
        
        [_db executeUpdate:SQLqingkongConditionOfmyCondition(tablename)];
    }
    [_db close];
    
}


#pragma mark---更新表数据功能

//更新指定id的内容
+(void)OcMyWantUpdateTableContentOfTableId:(NSString*)tableId tablename:(NSString*)tablename tableUpDateContent:(NSString*)tableUpdateContent AtPath:(NSString*)filePath
{
    FMDatabase *_db =[SuperDB OcMyWantGetSqlFromAtPath:filePath];
    if (![_db open])
    {
        [_db close];
        return;
    }
    [_db setShouldCacheStatements:YES];
    if ([_db tableExists:tablename])
    {
        
        [_db executeUpdate:SQLUpdateTableContentOftableId(tablename,tableUpdateContent,tableId)];
    }
    [_db close];
    
}
//自定义更新的符合条件的元素
+(void)OcMyWantUpdateTableContentOfmyCondition:(NSString*)myCondition tablename:(NSString*)tablename tableUpDateContent:(NSString*)tableUpdateContent AtPath:(NSString*)filePath
{
    FMDatabase *_db =[SuperDB OcMyWantGetSqlFromAtPath:filePath];
    if (![_db open])
    {
        [_db close];
        return;
    }
    [_db setShouldCacheStatements:YES];
    if ([_db tableExists:tablename])
    {
        
        [_db executeUpdate:SQLUpdateTableContentOfmyCondition(tablename,tableUpdateContent,myCondition)];
        
       // NSLog(@"%@",SQLUpdateTableContentOfmyCondition(tablename,tableUpdateContent,myCondition));
        
    }
    [_db close];
    
}

//添加新的表list
/**
 *newList=@"ni text"
 */

+(void)OcMyWantAddNewTableContentListofTableName:(NSString *)tablename newList:(NSString *)newList AtPath:(NSString *)filePath
{
    
    FMDatabase *_db =[SuperDB OcMyWantGetSqlFromAtPath:filePath];
    if (![_db open])
    {
        [_db close];
        return;
    }
    [_db setShouldCacheStatements:YES];
    if ([_db tableExists:tablename])
    {
        
        [_db executeUpdate:SQLADDTableContentList(tablename, newList)];
    }
    [_db close];
    
}
@end
