//
//  ViewController.m
//  ios_mysql_client
//
//  Created by Maxim Bilan on 24/12/13.
//  Copyright (c) 2013 Maxim Bilan. All rights reserved.
//

#import "ViewController.h"
#import "ExampleMySqlController.h"
#import "ExampleTable1MySqlTable.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ExampleMySqlController *cMySqlController = [[ExampleMySqlController alloc] init];
    [cMySqlController connectToDB:@"localhost"
                       withDbName:@"testdb"
                       withSocket:@"/Applications/MAMP/tmp/mysql/mysql.sock"
                         withPort:8889
                     withUsername:@"root"
                     withPassword:@"root"];
    ExampleTable1MySqlTable *table = (ExampleTable1MySqlTable *)[cMySqlController getTableById:ExampleTable1];
    if( table )
    {
        NSArray *arr = [table selectRows];
        NSLog( @"%@", arr );
        
        // insert
        ExampleTable1MySqlTableRow *row = [[ExampleTable1MySqlTableRow alloc] init];
        row.field1 = @"aaaaa";
        row.field2 = @"bbbbb";
        row.field3 = @"ccccc";
        [table insertRow:row];
     
        // update
        ExampleTable1MySqlTableRow *updateRow = [[ExampleTable1MySqlTableRow alloc] init];
        updateRow.tableId = 1;
        updateRow.field1 = @"hhhhh";
        updateRow.field2 = @"lllll";
        updateRow.field3 = @"zzzzz";
        [table updateRow:updateRow];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
