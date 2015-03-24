//
//  DetailViewController.h
//  Howl
//
//  Created by Ryan Paglinawan on 3/24/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

