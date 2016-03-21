//
//  NADAuthViewController.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADAuthViewController.h"

@interface NADAuthViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *doctorNameLabel;

@end

@implementation NADAuthViewController

- (IBAction)cancelButtonTapped:(UIBarButtonItem*)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)recordButtonTapped:(UIBarButtonItem*)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // TODO: HIGHLIGHT RECEPTION TIME
    
}

#pragma mark - UITextFieldDelegate
// Hide keyboard for every UITextField by button Done tap
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end