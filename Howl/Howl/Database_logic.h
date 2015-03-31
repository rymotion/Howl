//
//  Database_logic.h
//  Howl
//
//  Created by Ryan Paglinawan on 3/31/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DatabaseLogic : NSObject

- (instancetype)initWithDatabaseFilename:(NSString *)dbfilename;

@property (nonatomic, strong) NSMutableArray *arrColumnNames;

@property (nonatomic) int affectedRows;

@property (nonatomic) long long lastInsertedRowID;

@end
