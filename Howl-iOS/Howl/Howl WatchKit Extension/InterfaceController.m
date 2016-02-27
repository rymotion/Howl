//
//  InterfaceController.m
//  Howl WatchKit Extension
//
//  Created by Ryan Paglinawan on 5/9/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    NSLog(@"Display awake");
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    NSLog(@"Display will be seen");
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    NSLog(@"Display is not seen");
}

@end



