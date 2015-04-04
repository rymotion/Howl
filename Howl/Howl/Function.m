//
//  Function.m
//  Howl
//
//  Created by Ryan Paglinawan on 3/30/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
//  Comment any changes and what each function does so that no one gets lost

#import "Function.h"

@interface Function()

@end

@implementation Function

- (NSString *) filePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [paths objectAtIndex:0];
    return [documentDir stringByAppendingPathComponent:@"database.sql"];
    //returns full path of the SQLite database path that will be created in the Documents path on device
}

- (void) openDB {
    //creates the database
    if (sqlite3_open([[self filePath] UTF8String], &db) != SQLITE_OK ) {
        sqlite3_close(db);
        NSAssert(0, @"Database failed to open.");
    }
}

- (void) createTableNamed:(NSString *) tableName
               withField1:(NSString *) field1
               withField2:(NSString *) field2
               withField3:(NSString *) field3
               withField4:(NSString *) field4 {
    char *err;
    NSString *sql = [NSString stringWithFormat: @"CREATE TABLE IF NOT EXISTS '%@' ('%@' TEXT PRIMARY KEY, '%@' TEXT);", tableName, field1, field2, field3, field4];
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0, @"Tabled failed to create.");
    }
}


@end
