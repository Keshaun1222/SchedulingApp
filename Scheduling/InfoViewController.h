//
//  InfoViewController.h
//  Scheduling
//
//  Created by HSCC on 4/9/15.
//  Copyright (c) 2015 BDPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData/CoreData.h"

@class InfoViewController;

@protocol InfoViewControllerDelegate
- (void) infoViewControllerDidFinish:(InfoViewController *)controller;
@end

@interface InfoViewController : UIViewController

@property (weak, nonatomic) id <InfoViewControllerDelegate> delegate;

- (IBAction)back:(id)sender;

@end