//
//  Function.h
//  Howl
//
//  Created by Ryan Paglinawan on 3/30/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
//  This will take care of the whole functionality of the app. Hopefully
//  Comment any changes and what each function does so that no one gets lost

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface Function : NSObject {
    sqlite3 *db; //creates the sqlite 3 object
}

- (NSString *) filePath;

@property (strong) NSString *number;

@end
