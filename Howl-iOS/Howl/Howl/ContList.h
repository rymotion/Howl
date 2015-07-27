//
//  AddressBook.h
//  Howl
//
//  Created by Ryan Paglinawan on 4/24/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
@import AddressBook;
@import UIKit;

@class ContList;

@interface ContList

void ABAddressBookRequestAccessWithCompletion ( ABAddressBookRef addressBook, ABAddressBookRequestAccessCompletionHandler completion );

ABAuthorizationStatus ABAddressBookGetAuthorizationStatus ( void );

- (instancetype) initWithTitle:(NSString *) title
                       message:(NSString *) message
                      delegate:(id) delegate
             cancelButtonTitle:(NSString *) cancelButtonTitle otherButtonTitles:(NSString *) otherButtonTitles;

@end