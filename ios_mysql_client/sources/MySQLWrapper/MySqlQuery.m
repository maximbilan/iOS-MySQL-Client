//
//  MySqlQuery.m
//  ios_mysql_client
//
//  Created by Maxim Bilan on 20/11/13.
//  Copyright (c) 2013 Maxim Bilan. All rights reserved.
//

#import "MySqlQuery.h"
#import "MySqlDB.h"

@implementation MySqlQuery

- (id)init
{
    self = [super init];
    if (self) {
        result = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)execQuery:(NSString *)query toDB:(MySqlDB *)db
{
    [result removeAllObjects];
    
    if (mysql_query(db.mysql, query.UTF8String)) {
        [db mysqlError];
    }
    
    MYSQL_RES *res = mysql_use_result(db.mysql);
    if (res) {
        const unsigned int num_fields = mysql_num_fields(res);
        MYSQL_FIELD *field;
        NSMutableArray *data = [[NSMutableArray alloc] init];
        char *headers[num_fields];
        for (unsigned int i = 0; (field = mysql_fetch_field(res)); ++i) {
            headers[i] = field->name;
            NSMutableArray *rowData = [[NSMutableArray alloc] init];
            [data addObject:rowData];
        }
        
        MYSQL_ROW row;
        while ((row = mysql_fetch_row(res))) {
            for (unsigned int i = 0; i < [data count]; ++i) {
                NSString *sField = [NSString stringWithUTF8String:row[i]];
                [[data objectAtIndex:i] addObject:sField];
            }
        }
        
        for (unsigned int i = 0; i < [data count]; ++i) {
            [result setObject:[data objectAtIndex:i] forKey:[NSString stringWithUTF8String:headers[i]]];
        }
        
        mysql_free_result(res);
    }
}

- (NSMutableDictionary *)getResult
{
    return [result copy];
}

@end
