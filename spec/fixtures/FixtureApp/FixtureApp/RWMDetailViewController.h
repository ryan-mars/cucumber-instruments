//
//  RWMDetailViewController.h
//  FixtureApp
//
//  Created by Ryan Marsh on 3/18/14.
//  Copyright (c) 2014 Ryan Marsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWMDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
