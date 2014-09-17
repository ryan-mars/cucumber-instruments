//
//  RWMMasterViewController.h
//  FixtureApp
//
//  Created by Ryan Marsh on 3/18/14.
//  Copyright (c) 2014 Ryan Marsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RWMDetailViewController;

@interface RWMMasterViewController : UITableViewController

@property (strong, nonatomic) RWMDetailViewController *detailViewController;

@end
