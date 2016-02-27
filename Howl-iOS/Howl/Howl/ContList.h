//
//  AddressBook.h
//  Howl
//
//  Created by Ryan Paglinawan on 4/24/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
@import AddressBook;
@import UIKit;
@import Foundation;
#import <sqlite3.h>

@class ContList;

@interface ContList : NSObject
//  The variables for the database and the foreign key is in the ContList.m file not here
+ (sqlite3 *)sharedInstance; // This opens the sqlite3 database and gets ready for reading the data and setting the numbers we need from it to the main display
@property (nonatomic, retain) NSString *cname;
@property (nonatomic, retain) NSString *emsNum;
@property (nonatomic, retain) NSString *polNum;
@property (nonatomic, retain) NSString *firNum;

@end