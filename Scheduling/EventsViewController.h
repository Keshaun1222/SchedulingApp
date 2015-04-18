//
//  EventsViewController.h
//  Scheduling
//
//  Created by HSCC on 4/15/15.
//  Copyright (c) 2015 BDPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData/CoreData.h"

@class EventsViewController;

@protocol EventsViewControllerDelegate
- (void) eventsViewControllerDidFinish:(EventsViewController *)controller;
@end

@interface EventsViewController : UITableViewController <UITableViewDataSource>

@end