//
//  SuperDB.h
//
//  Created by mac on 14-10-12.
//  Copyright (c) 2014年 super-shuaishuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MySelfFMDB.h"
#import "FMDatabase.h"
@interface SuperDB : NSObject

//从制定地址获得sql,如果改地址下没有sql不会创建
+(FMDatabase *)OcMyWantGetSqlFromAtPath:(NSString*)filePath;
@end
