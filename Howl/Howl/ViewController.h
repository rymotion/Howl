//
//  ViewController.h
//  Howl
//
//  Created by Ryan Paglinawan on 3/30/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
//  Comment any changes and what each function does so that no one gets lost

#import <UIKit/UIKit.h>
#import "dataBase.h"
#import <Foundation/Foundation.h>
#import "Camera_implementation.h"
#import <Howl/MapViewController-Swift.h> //We need to import in the MapViewController to the main View Controller where everything is going to go into 

@interface ViewController : UIViewController {
        IBOutlet UITextField *regNoTextField;
        IBOutlet UITextField *nameTextField;
        IBOutlet UITextField *departmentTextField;
        IBOutlet UITextField *yearTextField;
        IBOutlet UITextField *findByRegisterNumberTextField;
        IBOutlet UIScrollView *myScrollView;
)
    -(IBAction)findData:(id)sender;
@end