//
//  FirstViewController.h
//  Scheduling
//
//  Created by HSCC on 4/2/15.
//  Copyright (c) 2015 BDPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTCalendar.h"
#import "CoreData/CoreData.h"
#import "EventsViewController.h"

@interface FirstViewController : UIViewController<JTCalendarDataSource, EventsViewControllerDelegate>

@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic) IBOutlet JTCalendarContentView *calendarContentView;

@property (strong,nonatomic) JTCalendar *calendar;

@property (strong, nonatomic) NSManagedObjectContext *managedContext;

@end

