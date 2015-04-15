//
//  DBManager.h
//  Howl
//
//  Created by Ryan Paglinawan on 4/8/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
//  Make any changes please comment them

#import <sqlite3.h>
#import <Foundation/Foundation.h>

@interface DBManager : NSObject

-(instancetype)initWithDatabaseFileaname:(NSString *)dbFilename;

@end
