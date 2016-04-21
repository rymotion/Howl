//
//  operationLogic.swift
//  Howl
//
//  Created by Ryan Paglinawan on 4/19/16.
//  Copyright © 2016 Ryan Paglinawan. All rights reserved.
//

import UIKit
import MessageUI
import WatchKit
import Foundation
import Dispatch

class OperationLogic: MFMessageComposeViewController, MFMessageComposeViewControllerDelegate, Place{
    func memDispatch(function: Void -> Void) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 4), function)
}
    
}