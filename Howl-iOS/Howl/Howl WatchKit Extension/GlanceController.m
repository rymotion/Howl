//
//  GlanceController.m
//  Howl WatchKit Extension
//
//  Created by Ryan Paglinawan on 5/9/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

#import "GlanceController.h"


@interface GlanceController()

@end


@implementation GlanceController
- (IBAction)howlGlance {
    /*  This is going to handle the functions for the WKGlace for Howl we should do 
        a force touch detector that would pop up an action menu or it both sends out a 911 call and a group MMS IDK just a thought */
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



