//
//  SecondViewController.m
//  Scheduling
//
//  Created by HSCC on 4/2/15.
//  Copyright (c) 2015 BDPA. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController {
    NSDictionary *teamMembers;
    NSArray *justNames;
    
    NSDictionary *friends;
    NSArray *friendsNames;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"HSCC Team";
    } else {
        return @"High School Friends";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return teamMembers.count;
    } else {
        return friends.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = justNames[indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Age: %@", teamMembers[justNames[indexPath.row]]];
    } else {
        cell.textLabel.text = friendsNames[indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Age: %@", friends[friendsNames[indexPath.row]]];
    }
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"plist"];
    teamMembers = [NSDictionary dictionaryWithContentsOfURL:url];
    justNames = teamMembers.allKeys;
    
    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"friends" withExtension:@"plist"];
    friends = [NSDictionary dictionaryWithContentsOfURL:url2];
    friendsNames = friends.allKeys;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) infoViewControllerDidFinish:(InfoViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showInfo"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
