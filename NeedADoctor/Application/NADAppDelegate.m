//
//  AppDelegate.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/18/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADAppDelegate.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

#define NavigationBarBackgroundColor [UIColor colorWithRed:0.1 green:0.46 blue:0.82 alpha:1]

@implementation NADAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Setups UI for navigationBar in whole App
    [UINavigationBar dt_setupAppearanceWithBackgroundColor:NavigationBarBackgroundColor];
    
    [Fabric with:@[[Crashlytics class]]];
    
    return YES;
}

@end