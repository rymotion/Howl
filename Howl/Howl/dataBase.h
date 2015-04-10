//
//  dataBase.h
//  Howl
//
//  Created by Ryan Paglinawan on 4/9/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface dataBase : NSObject
{
    NSString *databasePath;
}

+ (dataBase*)getSharedInstance;

-(BOOL)createDB;

-(BOOL)saveData:(NSString*)registerNumber
           name:(NSString*)name
     department:(NSString*)department
           year:(NSString*)year;

-(NSArray*)findByRegisterNumber:(NSString*)registerNumber;

@end
