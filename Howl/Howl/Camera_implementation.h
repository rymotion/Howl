//
//  Camera_implementation.h
//  Howl
//
//  Created by Ryan Paglinawan on 4/9/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Camera_implementation : UIViewController<UIImagePickerControllerDelegate> {
    UIImagePickerController *imagePicker;
    IBOutlet UIImageView *imageView;
}

-(IBAction)showCamera:(id)sender;

@end
