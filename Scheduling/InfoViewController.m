//
//  InfoViewController.m
//  Scheduling
//
//  Created by HSCC on 4/9/15.
//  Copyright (c) 2015 BDPA. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Info";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)back:(id)sender {
    [self.delegate infoViewControllerDidFinish:self];
}
@end