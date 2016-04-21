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

-(id)initWithName:(NSString *) cname emsNum:(NSString *) emsNum polNum:(NSString *) polNum firNum:(NSString *) firNum{
    if (self) {
        _cname = cname;
        _emsNum = emsNum;
        _polNum = polNum;
        _firNum = firNum;
        return self;
    }
    return nil;
}

+ (sqlite3 *) sharedInstance{
    
    if (database == NULL){
        sqlite3 *newConnection;
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [paths objectAtIndex:0];
        NSString *dataPath = [documentDirectory stringByAppendingPathComponent:@"howl.db"];
        
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
- (NSString*) getData:(NSString*) country{
    _cname = country;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dataPath = [documentDirectory stringByAppendingPathComponent:@"howl.db"];
    NSString *cData; //  Data from the country and emergency number
    
    if (sqlite3_open([dataPath UTF8String] , &database) == SQLITE_OK){
        NSLog(@"Database ready to be used");
        NSString *searchCount = [[NSString alloc]initWithFormat:@"SELECT eNid FROM country WHERE coname = '%@'", country];
        NSLog(@"search Query is : %@", searchCount);
        if (sqlite3_open([dataPath UTF8String], &database) == SQLITE_OK) {
            NSLog(@"Get the emNums");
            cData = [[NSString alloc] initWithFormat:@"SELECT * from emNum where id = '%@'", searchCount];
            
            _emsNum = [[NSString alloc] initWithFormat:@"SELECT emsNum from emNum where id = '%@'", searchCount];
            
            _polNum = [[NSString alloc] initWithFormat:@"SELECT polNum from emNum where id = '%@'", searchCount];
            
            _firNum = [[NSString alloc] initWithFormat:@"SELECT firNum from emNum where id = '%@'", searchCount];
        }
    }
    
    // Set the data for the Apple Watch
    NSUserDefaults *defaults = [[NSUserDefaults alloc]
                                initWithSuiteName:@"group.shareData.Howl"];
    
    [defaults setObject:_cname forKey:@"userCont"];
    [defaults setObject:_emsNum forKey:@"medicalNumber"];
    [defaults setObject:_polNum forKey:@"policeNumber"];
    [defaults setObject:_firNum forKey:@"fireNumber"];
    
    [defaults synchronize];
    
    return cData;
}


@end