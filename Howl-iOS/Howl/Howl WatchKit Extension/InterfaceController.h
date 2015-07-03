//
//  InterfaceController.h
//  Howl WatchKit Extension
//
//  Created by Ryan Paglinawan on 5/9/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
//  The following code/ properties and implemenations are for the WatchOS2 rollout in the fall

@import WatchKit;
@import Foundation;
//@import Contacts;

@interface InterfaceController : WKInterfaceController

/*  This will get the contact saved onto the watch */
@property (readonly, copy, nonatomic) NSString *contact;

/*  This will just copy the contact into the Apple Watch */
//@property (readonly, nonatomic) CNContactType contactType;

@end
