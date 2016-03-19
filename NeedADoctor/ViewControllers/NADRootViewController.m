//
//  ViewController.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/18/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADRootViewController.h"

@interface NADRootViewController ()

@end

@implementation NADRootViewController

- (void)awakeFromNib
{
    self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    self.contentViewShadowColor = [UIColor blackColor];
    self.contentViewShadowOffset = CGSizeMake(0, 0);
    self.contentViewShadowOpacity = 0.6;
    self.contentViewShadowRadius = 12;
    self.contentViewShadowEnabled = YES;
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftMenuViewController"];
    self.backgroundImage = [UIImage imageNamed:@"bg_heartbeat"];
    self.delegate = self;
}

@end