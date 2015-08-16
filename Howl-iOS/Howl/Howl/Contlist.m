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
        CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople( addressBook );
        CFIndex nPeople = ABAddressBookGetPersonCount( addressBook );
        for (int i = 0; i < nPeople; i++) {
            ABRecordRef ref;
            ref = CFArrayGetValueAtIndex( allPeople , i );
            /* This should be sent out to view on a list to the user to choose which contact they want to howl to*/
        }
    }
    else {
        appUsageWarn();
    }
}
ABAuthorizationStatus ABAddressBookGetAuthorizationStatus (void) {
    /* Get authorization to use the user's contact book */
}

UIView appUsageWarn() { // I'm trying to build a UIALERT view thing here but you can see it works so well
    /* This will prompt an alert that will say that user will only have access to contact emergency services until they allow Howl to use the contacts from phone */
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle: @"Heads Up"
                                                     message: @"You are restricted to only contact emergency services, ergo not able to use this app for your personal contacts. Is that okay?"
                                                    delegate: self
                           /* */
                                           cancelButtonTitle: @"Yes"
                                           otherButtonTitles: @"No", nil];
    /* This should connect the app to send it to the settings options in the settings menu */
    [alert show];
}