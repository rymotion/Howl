//
//  AddressBook.h
//  Howl
//
//  Created by Ryan Paglinawan on 4/24/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
//  The commented lines are going to be used in the next update in the Fall

@import Foundation;
@import UIKit;
@import AddressBook;
//@import Contacts;

@interface AddressBook : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *groups;

-(id)initWithAllGroups:(NSMutableArray *) allGroups
                  name:(NSString *)sourceName;

@property (nonatomic, readonly) ABAddressBookRef contactInfo;
@property (nonatomic, strong) NSMutableArray *source;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addContact;
//@property(readonly, copy, nonatomic) NSArray <CNLabeledValue<CNPhoneNumber *> *> *phoneNumbers;

@end