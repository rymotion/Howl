//
//  MasterViewController.h
//  Howl
//
//  Created by Ryan Paglinawan on 3/24/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

