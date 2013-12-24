//
//  MySqlDB.h
//  ios_mysql_client
//
//  Created by Maxim Bilan on 19/11/13.
//  Copyright (c) 2013 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "mysql.h"

@interface MySqlDB : NSObject
{
    MYSQL *mysql;
}

@property (nonatomic, strong) NSString  *socket;
@property (nonatomic, strong) NSString  *serverName;
@property (nonatomic, strong) NSString  *dbName;
@property                     NSInteger port;
@property (nonatomic, strong) NSString  *userName;
@property (nonatomic, strong) NSString  *password;

@property (readonly)          MYSQL     *mysql;

- (void)connect;
- (void)disconnect;
- (void)mysqlError;
- (BOOL)isConnected;

@end
