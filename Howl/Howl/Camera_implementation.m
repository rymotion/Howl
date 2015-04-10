//
//  Camera_implementation.m
//  Howl
//
//  Created by Ryan Paglinawan on 4/9/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
//  Commit any changes

#import "Camera_implementation.h"

@interface Camera_implementation ()

@end

@implementation Camera_implementation

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showCamera:(id)sender {
    imagePicker.allowsEditing = NO;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentModalViewController:imagePicker animated:YES];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (image == nil){
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    imageView.image = image;
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissModalViewControllerAnimated:YES];
}

@end
