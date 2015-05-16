//
//  InterfaceController.h
//  Howl WatchKit Extension
//
//  Created by Ryan Paglinawan on 5/9/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

+(WKInterfaceDevice *)currentdevice;

+(BOOL) openParentApplication:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *, NSError *))reply;
@end
