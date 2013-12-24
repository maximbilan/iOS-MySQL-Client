//
//  MySqlTable.h
//  ios_mysql_client
//
//  Created by Maxim Bilan on 20/11/13.
//  Copyright (c) 2013 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MySqlDB;
@class MySqlQuery;

@interface MySqlTableRow : NSObject

@property (nonatomic) NSUInteger rowId;

@end

@interface MySqlTable : NSObject

@property (nonatomic, strong) MySqlDB       *db;
@property (nonatomic, strong) MySqlQuery    *query;
@property (nonatomic)         NSUInteger    tableId;
@property (nonatomic, strong) NSString      *name;

@end

@protocol MySqlTableDelegate <NSObject>

@required
- (NSArray *)selectRows;
- (void)updateRow:(MySqlTableRow *)row;
- (void)insertRow:(MySqlTableRow *)row;

@end