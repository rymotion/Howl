//
//  contactGrab.swift
//  Howl
//
//  Created by Ryan Paglinawan on 4/19/16.
//  Copyright © 2016 Ryan Paglinawan. All rights reserved.
//

import Foundation
import Contacts
import ContactsUI

class userContacts: UIViewController{
    
    override func didReceiveMemoryWarning() {
        print("Override memory for contacts")
        super.didReceiveMemoryWarning()
    }
    
    let keysToFetch = [CNContactPhoneNumbersKey, CNContactGivenNameKey, CNContactFormatter.descriptorForRequiredKeysForStyle(.PhoneticFullName)]
    
}