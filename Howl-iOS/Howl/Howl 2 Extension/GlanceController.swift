//
//  GlanceController.swift
//  Howl 2 Extension
//
//  Created by Ryan Paglinawan on 10/25/15.
//  Copyright © 2015 Ryan Paglinawan. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        print("Glace Control awake");
        // Configure interface objects here.
    }
    @IBOutlet var myText: WKInterfaceGroup!

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("Glance about to be awake");
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        print("Glace not visible");
    }

}
