//
//  PictureView.h
//  Howl
//
//  Created by Ryan Paglinawan on 5/25/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class CIDetector;

@interface PictureView : UIViewController <UIGestureRecognizerDelegate, AVCaptureVideoDataOutputSampleBufferDelegate>
{
    IBOutlet UIView *previewView;
    IBOutlet UISegmentedControl *camerasControl;
    AVCaptureVideoPreviewLayer *previewLayer;
    AVCaptureVideoDataOutput *videoDataOutput;
    BOOL detectFaces;
    dispatch_queue_t videoDataOutputQueue;
    AVCaptureStillImageOutput *stillImageOutput;
    UIView *flashView;
    UIImage *square;
    BOOL isUsingFrontFacingCamera;
    CIDetector *faceDetector;
    CGFloat beginGestureScale;
    CGFloat effectiveScale;
}

- (IBAction)takePicture:(id)sender;
- (IBAction)switchCameras:(id)sender;
- (IBAction)toggleFaceDetection:(id)sender;
