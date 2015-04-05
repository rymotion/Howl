//
//  ViewController.m
//  Howl
//
//  Created by Ryan Paglinawan on 3/30/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
//  Comment any changes and what each function does so that no one gets lost

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (NSString *) filePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [paths objectAtIndex:0];
    return [documentDir stringByAppendingPathComponent:@"dataBaseHowl.sql"];
    //returns full path of the SQLite database path that will be created in the Documents path on device
}

- (void) openDB {
    //creates the database
    if (sqlite3_open([[self filePath] UTF8String], &db) != SQLITE_OK ) {
        sqlite3_close(db);
        NSAssert(0, @"Database failed to open.");
    }
}

- (void) createTableNamed:(NSString *) tableName
               withField1:(NSString *) school
               withField2:(NSString *) schoolInit
               withField3:(NSString *) campusNam
               withField4:(NSString *) secOff {
    char *err;
    NSString *sql = [NSString stringWithFormat: @"CREATE TABLE IF NOT EXISTS '%@' ('%@' TEXT PRIMARY KEY, '%@' TEXT);", tableName, school, schoolInit, campusNam, secOff];
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0, @"Tabled failed to create.");
    }
}

- (void) callNumber {//this should cycle through the database match the campus and security office number (GPS location code stuff should also go here)
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel: "]];
}

- (IBAction) btnSend: (id) call{//this is going to recognize the call button pressed to call the number from the database
    [self callNumber];
} 
- (void) viewDidLoad {
    [self openDB]; // this will open database
    [self createTableNamed:@"Howl Directory" withField1:@"School Name" withField2:@"School Initials" withField3:@"Campus Name" withField4:@"Security Office"];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

#pragma mark

@interface GPSViewController()

@end

@implementation GPSViewController

@synthesize latitudeTextField, longitudeTextField, accuracyTextField;

- (void) viewDidLoad {
    
    lm = [[CLLocationManager alloc]init];
    if ([CLLocationManager authorizationStatus]) {
        
        lm.delegate = self;
        lm.desiredAccuracy = kCLLocationAccuracyBest;
        lm.distanceFilter = 1000.0f;
        [lm startUpdatingLocation];
        
    }
    else {
        NSString *msg = @"Looks like location services is not enabled";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message: msg
                                                       delegate:nil
                                              cancelButtonTitle: @"Ok"
                                              otherButtonTitles: @"Settings", nil];
    }
}
- (void) locationManager:(CLLocationManager *)manager
     didUpdateToLocation:(CLLocation *) newLocation
            fromLocation:(CLLocation *)oldLocation {
    
    NSString *lat = [[NSString alloc] initWithFormat:@"%g", newLocation.coordinate.latitude];
    latitudeTextField.text = lat;
    
    NSString *lng = [[NSString alloc] initWithFormat:@"%g", newLocation.coordinate.longitude];
    longitudeTextField.text = lng;
    
    NSString *acc = [[NSString alloc] initWithFormat:@"%g", newLocation.horizontalAccuracy];
    accuracyTextField.text = acc;
    
}
- (void) locationManager:(CLLocationManager *)manager
        didFailWithError:(NSError *)error {
    
    NSString *msg = @"Error obtaining location";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:msg delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end