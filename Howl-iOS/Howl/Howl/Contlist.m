//
//  AddressBook.m
//  Howl
//
//  Created by Ryan Paglinawan on 4/24/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
#import "ContList.h"

@interface ContList()

@end

@implementation ContList

static sqlite3 *database;
static sqlite3_stmt *enableForeignKey;
static sqlite3 *dataPath;

+ (sqlite3 *) sharedInstance{
    
    if (database == NULL){
        sqlite3 *newConnection;
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [paths objectAtIndex:0];
        NSString *path = [documentDirectory stringByAppendingPathComponent:@"Howl.sql"];
        
        if(sqlite3_open([path UTF8String], &newConnection) == SQLITE_OK){
            NSLog(@"Database loaded");
            
            database = newConnection;
            
            if(sqlite3_prepare_v2(database, "PRAGMA foreign_keys = ON", -1, &enableForeignKey, NULL) != SQLITE_OK){
                NSLog(@"ERROR IN PRAGMA !");
            }
            
            sqlite3_finalize(enableForeignKey);
        } else {
            NSLog(@"Error in opening database, resetting");
            database = NULL;
        }
    }
    NSLog(@"Database ready to use.");
    return database;
}
-(void) getData{
    if (sqlite3_open_v2([dataPath UTF8String] , &database) == SQLITE_OK){
        sqlite3_stmt *selectStmt;
        
        NSString *querySelect = [NSString stringWithFormat:@"SELECT * FROM country"];
        NSLog(@"Selected =%@", querySelect);
        
        if (sqlite3_prepare_v2(database, [querySelect UTF8String], -1, &selectStmt, NULL) == SQLITE3_OK) {
            while (sqlite3_step(selectStmt) == SQLITE_ROW) {
                char 
            }
        }
    }
}

@end