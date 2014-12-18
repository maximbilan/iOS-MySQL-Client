//
//  MySqlTable.m
//  ios_mysql_client
//
//  Created by Maxim Bilan on 20/11/13.
//  Copyright (c) 2013 Maxim Bilan. All rights reserved.
//

#import "MySqlTable.h"
#import "MySqlDB.h"
#import "MySqlQuery.h"

@implementation MySqlTableRow

@synthesize rowId = _rowId;

@end

@implementation MySqlTable

@synthesize db = _db;
@synthesize query = _query;
@synthesize tableId = _tableId;
@synthesize name = _name;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _query = [[MySqlQuery alloc] init];
    }
    return self;
}

@end
