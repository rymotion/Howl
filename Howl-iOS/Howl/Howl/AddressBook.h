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
#import <AddressBook/ABAddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <UIKit/UIKit.h>

@interface AddressBook : NSObject
- (void) authorizationView;
- (void) getContacsWithAddressBook:(ABAddressBookRef) addressBook;

/*  This will have all the stuff about the contact  */
@property (nonatomic, strong) NSDictionary *dictContDetails;

/*  Contact Info  */
@property (nonatomic, weak) IBOutlet UILabel *lblContInfo;

/*  Contact ID Picture that is stored from the user */
@property (nonatomic, weak) IBOutlet UIImage *contId;

/*  This is going to set it in a tableView  */
@property (nonatomic, weak) IBOutlet UITableView *tblContDetails;

@end
