//
//  ExampleTable1MySqlTable.m
//  ios_mysql_client
//
//  Created by Maxim Bilan on 24/12/13.
//  Copyright (c) 2013 Maxim Bilan. All rights reserved.
//

#import "ExampleTable1MySqlTable.h"

#import "MySqlQuery.h"

@implementation ExampleTable1MySqlTableRow

@end

@interface ExampleTable1MySqlTable ()

- (void)transformDict:(NSDictionary *)dict toArray:(NSMutableArray **)data;

@end

@implementation ExampleTable1MySqlTable

- (NSArray *)selectRows
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSString *queryString = [NSString stringWithFormat:@"SELECT * FROM %@;", self.name];
    [self.query execQuery:queryString toDB:self.db];
    
    NSDictionary *dict = [self.query getResult];
    if (dict) {
        [self transformDict:dict toArray:&result];
    }
    
    return [result copy];
}

- (NSArray *)selectRowsByChartId:(NSString *)tableId
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSString *queryString = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE table_id='%@';", self.name, tableId];
    [self.query execQuery:queryString toDB:self.db];
    
    NSDictionary *dict = [self.query getResult];
    if (dict) {
        [self transformDict:dict toArray:&result];
    }
    
    return [result copy];
}

- (void)transformDict:(NSDictionary *)dict toArray:(NSMutableArray **)data
{
    NSArray *idArray = [dict valueForKey:@"table_id"];
    NSArray *field1Array = [dict valueForKey:@"field1"];
    NSArray *field2Array = [dict valueForKey:@"field2"];
    NSArray *field3Array = [dict valueForKey:@"field3"];
    
    for (NSUInteger index = 0; index < [idArray count]; ++index) {
        ExampleTable1MySqlTableRow *row = [[ExampleTable1MySqlTableRow alloc] init];
        row.tableId = [[idArray objectAtIndex:index] integerValue];
        row.field1 = [field1Array objectAtIndex:index];
        row.field2 = [field2Array objectAtIndex:index];
        row.field3 = [field3Array objectAtIndex:index];
        
        [*data addObject:row];
    }
}

- (void)updateRow:(ExampleTable1MySqlTableRow *)row
{
    NSString *queryString = [NSString stringWithFormat:@"UPDATE %@ SET field1='%@', field2='%@', field3='%@' WHERE table_id=%ld", self.name, row.field1, row.field2, row.field3, (long)row.tableId];
    [self.query execQuery:queryString toDB:self.db];
}

- (void)insertRow:(ExampleTable1MySqlTableRow *)row
{
    NSString *queryString = [NSString stringWithFormat:@"INSERT INTO %@ (table_id, field1, field2, field3) VALUES ('%ld', '%@', '%@', '%@')", self.name, (long)row.tableId, row.field1, row.field2, row.field3];
    [self.query execQuery:queryString toDB:self.db];
}

@end
