//
//  AddressBook.m
//  Howl
//
//  Created by Ryan Paglinawan on 4/24/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressBook.h"

@implementation AddressBook

-(id)initWithAllGroups:(NSMutableArray *)allGroups name:(NSString *)sourceName{
    self = [super init];
    
    if(self != nil){
        _groups = allGroups;
        _name = sourceName;
    }
    return self;
}

@end
