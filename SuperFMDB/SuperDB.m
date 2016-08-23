//
//  SuperDB.h
//
//  Created by mac on 14-10-12.
//  Copyright (c) 2014年 super-shuaishuai. All rights reserved.
//

#import "SuperDB.h"

@implementation SuperDB
static FMDatabase *_db;


+(FMDatabase *)OcMyWantGetSqlFromAtPath:(NSString*)filePath;
{
    //每一次调用该方法返回fmdb对象
    _db =[[FMDatabase alloc]initWithPath:SQLFILEPATH(filePath)];
    return _db;
}@end
