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

+ (sqlite3 *) sharedInstance{
    
    if (database == NULL){
        sqlite3 *newConnection;
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [paths objectAtIndex:0];
        NSString *dataPath = [documentDirectory stringByAppendingPathComponent:@"Howl.sql"];
        
        if(sqlite3_open([dataPath UTF8String], &newConnection) == SQLITE_OK){
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
/*+(NSString *) getData:(NSString*) country{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dataPath = [documentDirectory stringByAppendingPathComponent:@"Howl.sql"];
    NSString *cData; //  Data from the country and emergency number
    
    if (sqlite3_open([dataPath UTF8String] , &database) == SQLITE_OK){
        NSLog(@"Database ready to be used");
        NSString *searchCount = [[NSString alloc]initWithFormat:@"SELECT distinct en_Num, coname FROM country WHERE coname = '%@'", country];
        NSLog(@"search Query is : '%@'", searchCount);
        
        //sqlite3_stmt * // Continue from here
        // Need to be done is: pulling data from a database
                                 
    }
    return cData;

}*/

@end