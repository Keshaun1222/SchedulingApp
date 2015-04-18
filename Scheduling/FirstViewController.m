//
//  FirstViewController.m
//  Scheduling
//
//  Created by HSCC on 4/2/15.
//  Copyright (c) 2015 BDPA. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () {
    NSMutableDictionary *eventsByDate;
    NSManagedObjectContext *context;
}

@end

@implementation FirstViewController
@synthesize managedContext;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    context = [self managedContext];
    
    self.calendar = [JTCalendar new];
    
    self.calendar.calendarAppearance.ratioContentMenu = 1.;
    self.calendar.calendarAppearance.menuMonthTextColor = [UIColor blackColor];
    self.calendar.calendarAppearance.dayTextColor = [UIColor blackColor];
    self.calendar.calendarAppearance.dayCircleColorSelected = [UIColor grayColor];
    self.calendar.calendarAppearance.dayTextColorSelected = [UIColor whiteColor];
    
    [self.calendar setMenuMonthsView:self.calendarMenuView];
    [self.calendar setContentView:self.calendarContentView];
    [self.calendar setDataSource:self];
    
    [self createRandomEvents];
    
    [self.calendar reloadData];
}

- (void)viewDidLayoutSubviews {
    [self.calendar repositionViews];
}

- (BOOL)calendarHaveEvent:(JTCalendar *)calendar date:(NSDate *)date {
    return NO;
}

- (void)calendarDidDateSelected:(JTCalendar *)calendar date:(NSDate *)date {
    NSString *key = [[self dateFormatter] stringFromDate:date];
    NSArray *events = eventsByDate[key];
    
    NSLog(@"Date: %@ - %ld events", date, [events count]);
    //NSLog(@"%@", date);
}

#pragma mark - Buttons callback

- (IBAction)didGoTodayTouch
{
    [self.calendar setCurrentDate:[NSDate date]];
}

#pragma mark - JTCalendarDataSource

/*- (void)calendarDidLoadPreviousPage
{
    NSLog(@"Previous page loaded");
}

- (void)calendarDidLoadNextPage
{
    NSLog(@"Next page loaded");
}*/

- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"MM-dd-yyyy";
    }
    
    return dateFormatter;
}

- (void)loadEvents {
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *classes = [NSEntityDescription entityForName:@"Classes" inManagedObjectContext:context];
    [fetchRequest setEntity:classes];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *class in fetchedObjects) {
        NSString *dotw = [class valueForKey:@"dotw"];
        NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:[dotw length]];
        for (int i=0; i < [dotw length]; i++) {
            NSString *days  = [NSString stringWithFormat:@"%c", [dotw characterAtIndex:i]];
            [characters addObject:days];
        }
    }
    
    eventsByDate = [NSMutableDictionary new];
    
    for(int i = 0; i < 30; ++i) {
        NSDate *randomDate = [NSDate dateWithTimeInterval:(rand() % (3600 * 24 * 60)) sinceDate:[NSDate date]];
        
        NSString *key = [[self dateFormatter] stringFromDate:randomDate];
        
        if (!eventsByDate[key]) {
            eventsByDate[key] = [NSMutableArray new];
        }
        
        [eventsByDate[key] addObject:randomDate];
    }
}

- (void)createRandomEvents {
    eventsByDate = [NSMutableDictionary new];
    
    for(int i = 0; i < 30; ++i) {
        NSDate *randomDate = [NSDate dateWithTimeInterval:(rand() % (3600 * 24 * 60)) sinceDate:[NSDate date]];
        
        NSString *key = [[self dateFormatter] stringFromDate:randomDate];
        
        if (!eventsByDate[key]) {
            eventsByDate[key] = [NSMutableArray new];
        }
        
        [eventsByDate[key] addObject:randomDate];
    }
}

- (void)eventsViewControllerDidFinish:(EventsViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showEvents"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
