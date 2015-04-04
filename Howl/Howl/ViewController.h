//
//  ViewController.h
//  Howl
//
//  Created by Ryan Paglinawan on 3/30/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
//  Comment any changes and what each function does so that no one gets lost

#import <UIKit/UIKit.h>
#import "sqlite3.h"
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController {
    sqlite3 *db; //creates the sqlite 3 object
}

- (NSString *) filePath;

@end

#pragma mark

@interface GPSViewController : UIViewController <CLLocationManagerDelegate>{ //this is going to get the user's location and bring it into the sqlite database to compare it so that it can get the proper information set stuff.
    IBOutlet UITextField *latitudeTextField; /*Right now this*/
    IBOutlet UITextField *longitudeTextField; /*only outputs to*/
    IBOutlet UITextField *accuracyTextField; /*a text field in the main UI*/
    CLLocationManager *lm;
}

@property (retain, nonatomic) UITextField *latitudeTextField;
@property (retain, nonatomic) UITextField *longitudeTextField;
@property (retain, nonatomic) UITextField *accuracyTextField;

@end

