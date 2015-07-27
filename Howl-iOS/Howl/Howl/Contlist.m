//
//  AddressBook.m
//  Howl
//
//  Created by Ryan Paglinawan on 4/24/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
#import "ContList.h"

void ABAddressBookRequestAccessWithCompletion ( ABAddressBookRef addressBook, ABAddressBookRequestAccessCompletionHandler granted ) {
    if (granted){
        /* This will get the contacts from the phone */
        addressBook = ABAddressBookCreate( );
        CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople( addressBook );
        CFIndex nPeople = ABAddressBookGetPersonCount( addressBook );
        for (int i = 0; i < nPeople; i++) {
            ABRecordRef ref = CFArrayGetValueAtIndex( allPeople , i );
            /* This should be sent out to view on a list to the user to choose which contact they want to howl to*/
        }
    }
    else {
        /* This will prompt an alert that will say that user will only have access to contact emergency services until they allow Howl to use the contacts from phone */
        UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"Warning"
                                                                       message:
                                    @"You will only be able to use the emergency number(s) of this current location until you allow access to use your contacts"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Got it" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController: alert animated: YES completion: nil];
    }
}
ABAuthorizationStatus ABAddressBookGetAuthorizationStatus (void) {
    /* Get authorization to use the user's contact book */
}
