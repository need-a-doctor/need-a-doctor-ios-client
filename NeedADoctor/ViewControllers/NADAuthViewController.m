//
//  NADAuthViewController.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADAuthViewController.h"

@interface NADAuthViewController ()

@end

@implementation NADAuthViewController

- (IBAction)cancelButtonTapped:(UIBarButtonItem*)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)recordButtonTapped:(UIBarButtonItem*)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end