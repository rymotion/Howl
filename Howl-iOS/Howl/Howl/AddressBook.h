//
//  AddressBook.h
//  Howl
//
//  Created by Ryan Paglinawan on 4/24/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/ABAddressBook.h>
#import <AddressBook/ABGroup.h>
#import <AddressBook/ABMultiValue.h>
#import <AddressBook/ABPerson.h>
#import <AddressBook/ABRecord.h>
#import <AddressBook/ABSource.h>
#import <AddressBook/AddressBook.h>
#import <AddressBook/AddressBookDefines.h>
#import <UIKit/UIAlertView.h>
#import <UIKit/UIAlert.h>

@interface AddressBook : NSObject
- (void) authorizationView;
- (void) listPeopleInAddressBook:(ABAddressBookRef) addressBook;
@end
