//
//  ExampleMySqlController.m
//  ios_mysql_client
//
//  Created by Maxim Bilan on 24/12/13.
//  Copyright (c) 2013 Maxim Bilan. All rights reserved.
//

#import "ExampleMySqlController.h"
#import "ExampleTable1MySqlTable.h"

static NSString * const ExampleTableNames[]   = { @"example_table_1" };

@implementation ExampleMySqlController

- (void)initTables
{
    ExampleTable1MySqlTable *table1 = [[ExampleTable1MySqlTable alloc] init];
    [table1 setTableId:ExampleTable1];
    [table1 setName:ExampleTableNames[ExampleTable1]];
    [table1 setDb:db];
    [tables addObject:table1];
}

@end
