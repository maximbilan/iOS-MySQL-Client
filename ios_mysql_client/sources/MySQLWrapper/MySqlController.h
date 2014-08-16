//
//  MySqlController.h
//  ios_mysql_client
//
//  Created by Maxim Bilan on 21/11/13.
//  Copyright (c) 2013 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MySqlDB;
@class MySqlTable;

@interface MySqlController : NSObject
{
    MySqlDB         *db;
    NSMutableArray  *tables;
}

- (void)initTables;
- (void)connectToServer:(NSString *)serverName withDbName:(NSString *)dbName
             withSocket:(NSString *)socket withPort:(NSInteger)port
           withUsername:(NSString *)username withPassword:(NSString *)password;
- (void)disconnect;
- (MySqlTable *)getTableById:(NSInteger)tableId;

@end
