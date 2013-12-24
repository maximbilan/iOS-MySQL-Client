//
//  MySqlQuery.h
//  ios_mysql_client
//
//  Created by Maxim Bilan on 20/11/13.
//  Copyright (c) 2013 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MySqlDB;

@interface MySqlQuery : NSObject
{
    NSMutableDictionary *result;
}

- (void)execQuery:(NSString *)query withDB:(MySqlDB *)db;
- (NSMutableDictionary *)getResult;

@end
