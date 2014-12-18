//
//  MySqlDB.m
//  ios_mysql_client
//
//  Created by Maxim Bilan on 19/11/13.
//  Copyright (c) 2013 Maxim Bilan. All rights reserved.
//

#import "MySqlDB.h"

@implementation MySqlDB

@synthesize socket = _socket;
@synthesize serverName = _serverName;
@synthesize dbName = _dbName;
@synthesize port = _port;
@synthesize userName = _userName;
@synthesize password = _password;
@synthesize mysql;

- (instancetype)init
{
    self = [super init];
    if (self) {
        if (mysql_library_init(0, NULL, NULL)) {
            NSLog(@"MySQL library isn't initialized...");
            return nil;
        }
    }
    return self;
}

- (void)connect
{
    mysql = mysql_init(NULL);
    const char* prms[5];
    
    prms[0] = (_socket) ? _socket.UTF8String : NULL;
    prms[1] = (_serverName) ? _serverName.UTF8String : "localhost";
    prms[2] = (_dbName) ? _dbName.UTF8String : NULL;
    prms[3] = (_userName) ? _userName.UTF8String : "root";
    prms[4] = (_password) ? _password.UTF8String : "";
    
    if (!mysql_real_connect(mysql, prms[1], prms[3], prms[4], prms[2], _port, prms[0], 0)) {
        [self mysqlError];
        return;
    }

    if (mysql_set_character_set(mysql, "utf8")) {
        [self mysqlError];
    }
}

- (void)disconnect
{
    if (mysql) {
        mysql_close(mysql);
        mysql = nil;
    }
}

- (void)mysqlError
{
    const char* ch = mysql_error(mysql);
    if (ch) {
        NSString *error = @(ch);
        if (error.length) {
            NSLog(@"MySQL error: %@", error);
        }
    }
}

- (BOOL)isConnected
{
    return mysql_stat(mysql) ? YES : NO;
}

@end
