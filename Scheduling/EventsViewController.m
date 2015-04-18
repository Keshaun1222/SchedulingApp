//
//  EventsViewController.m
//  Scheduling
//
//  Created by HSCC on 4/15/15.
//  Copyright (c) 2015 BDPA. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController()

@end

@implementation EventsViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Classes";
    } else {
        return @"Meetings";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = @"Placeholder";
    cell.detailTextLabel.text = @"Placeholder";
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end