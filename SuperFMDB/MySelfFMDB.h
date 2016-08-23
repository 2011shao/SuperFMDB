//
//  SuperDB.h
//
//  Created by mac on 14-10-12.
//  Copyright (c) 2014年 super-shuaishuai. All rights reserved.
//

#ifndef FMDB________MySelfFMDB_h
#define FMDB________MySelfFMDB_h
//------私人定制FMDB需要导入的头文件
#import "SuperDB.h"//通过地址获取数据库的类
#import "SuperPeople.h"//查询数据类
#import "SuperFMDB.h"//方法类,增删改查方法

#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMResultSet.h"



//填写创建的sql的文件地址
#define SQLFILEPATH(filePath) [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",filePath]]

//tablecontent(who text, ni text ,age integer)
//添加表的名字,和表的内容列表
#define SQLTableContentWithTableName(tablename,tablecontent) [NSString stringWithFormat:@"CREATE TABLE %@ (id INTEGER PRIMARY KEY AUTOINCREMENT,%@)",tablename,tablecontent]

//给表添加内容
#define  SQLADDTableContent(tablename,tablecontent,addcontent) [NSString stringWithFormat:@"INSERT INTO %@ (%@) VALUES (%@)",tablename,tablecontent,addcontent]

//查询
#define SQLSELECTTableContentOfmyCondition(tablename,myCondition) [NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@",tablename,myCondition]
///**
// *  特殊查询
// *
// */
//#define TTSQLSELECTTableContentOfmyCondition(tablename,myCondition) [NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@",tablename,myCondition]
//


#define SQLSELECTTableContent(tablename) [NSString stringWithFormat:@"SELECT * FROM %@",tablename]

//删除
#define SQLDelectALL(tablename)  [NSString stringWithFormat:@"DROP TABLE %@",tablename]


#define SQLDelectmyConditionOfmyCondition(tablename,myCondition) [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@",tablename,myCondition]


#define SQLqingkongConditionOfmyCondition(tablename) [NSString stringWithFormat:@"DELETE FROM  %@",tablename]


//更新表里制定id的内容
//tableUpContent=@"name='mingzi'"
#define SQLUpdateTableContentOftableId(tablename,tableUpcontent,tableId) [NSString stringWithFormat:@"UPDATE %@ SET %@ WHERE id=%@",tablename,tableUpcontent,tableId]



//更新表里制定id的内容
//tableUpContent=@"name='mingzi'"
#define SQLUpdateTableContentOfmyCondition(tablename,tableUpcontent,myCondition) [NSString stringWithFormat:@"UPDATE %@ SET %@ WHERE %@",tablename,tableUpcontent,myCondition]



#define SQLADDTableContentList(tablename,newList) [NSString stringWithFormat:@"alter table %@ add %@",tablename,newList]











#endif
