//
//  ExampleTable1MySqlTable.h
//  ios_mysql_client
//
//  Created by Maxim Bilan on 24/12/13.
//  Copyright (c) 2013 Maxim Bilan. All rights reserved.
//

#import "MySqlTable.h"

@interface ExampleTable1MySqlTableRow : MySqlTableRow

@property (nonatomic)           NSInteger   tableId;
@property (nonatomic, strong)   NSString    *field1;
@property (nonatomic, strong)   NSString    *field2;
@property (nonatomic, strong)   NSString    *field3;

@end

@interface ExampleTable1MySqlTable : MySqlTable <MySqlTableDelegate>

- (NSArray *)selectRows;
- (NSArray *)selectRowsByChartId:(NSString *)chartId;
- (void)updateRow:(ExampleTable1MySqlTableRow *)row;
- (void)insertRow:(ExampleTable1MySqlTableRow *)row;

@end
