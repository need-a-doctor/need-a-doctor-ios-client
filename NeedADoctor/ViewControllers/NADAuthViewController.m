//
//  NADAuthViewController.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADAuthViewController.h"
#import "NADReceptionTime.h"

@interface NADAuthViewController () <UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *doctorNameLabel;

@property (nonatomic) NSDate *day;
@property (nonatomic) NADDoctorModel *doctor;

@property (nonatomic, readonly) NADReceptionTime *currentUserReceptionTime;
@property (nonatomic, weak) id<NADDoctorTableViewProtocol> delegate;

@end

@implementation NADAuthViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup date
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    self.dateLabel.text = [dateFormatter stringFromDate:self.day];
    
    // Setup time
    [dateFormatter setDateFormat:@"HH:mm"];
    self.timeLabel.text = [dateFormatter stringFromDate:self.currentUserReceptionTime.time];
    
    // Doctor name
    self.doctorNameLabel.text = self.doctor.name;
}

#pragma mark - Setups
- (void)setupWithDay:(NSDate *)day doctor:(NADDoctorModel *)doctor delegate:(id<NADDoctorTableViewProtocol>)delegate {
    self.delegate = delegate;
    self.day = day;
    self.doctor = doctor;
}

#pragma mark - Accessors
- (NADReceptionTime *)currentUserReceptionTime {
    for (NADReceptionTime *receptionTime in self.doctor.receptionTimes) {
        if (receptionTime.isBusy && receptionTime.isCurrentUser) {
            return receptionTime;
        }
    }
    return nil;
}

#pragma mark - User interaction
- (IBAction)cancelButtonTapped:(UIBarButtonItem*)btn {
    self.currentUserReceptionTime.isBusy = NO;
    self.currentUserReceptionTime.isCurrentUser = NO;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)recordButtonTapped:(UIBarButtonItem*)btn {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Запись" message:@"Вы успешно записались к врачу" delegate:self cancelButtonTitle:@"Ок" otherButtonTitles:nil];
    [alertView show];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ([self.delegate respondsToSelector:@selector(currentUserDidRecorded)]) {
        [self.delegate currentUserDidRecorded];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate
// Hide keyboard for every UITextField by button Done tap
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end