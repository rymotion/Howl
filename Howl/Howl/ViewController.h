//
//  ViewController.h
//  Howl
//
//  Created by Ryan Paglinawan on 3/30/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface ViewController : UIViewController {
    sqlite3 *db; //creates the sqlite 3 object
}

- (NSString *) filePath;

@end

