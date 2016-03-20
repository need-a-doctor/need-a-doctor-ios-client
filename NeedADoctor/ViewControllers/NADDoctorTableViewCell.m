//
//  NADDoctorTableViewCell.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADDoctorTableViewCell.h"
#import "NADReceptionTime.h"

@interface NADDoctorTableViewCell ()

//@property (weak, nonatomic) IBOutlet UIButton *receptionHours1Button;

// Date
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *mounthLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekdayLabel;

// Hospital & Doctor
@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *doctorNameLabel;

// Reception hours
@property (weak, nonatomic) IBOutlet UIButton *recepientHours1;
@property (weak, nonatomic) IBOutlet UIButton *recepientHours2;
@property (weak, nonatomic) IBOutlet UIButton *recepientHours3;
@property (weak, nonatomic) IBOutlet UIButton *recepientHours4;
@property (weak, nonatomic) IBOutlet UIButton *recepientHours5;

@property (weak, nonatomic) IBOutlet UIButton *moreReceptionHoursButton;

@end

@implementation NADDoctorTableViewCell

#pragma mark - Setups
- (void)setupWithDay:(NSDate *)day doctor:(NADDoctorModel *)doctor {
    // Borders
    for (UIButton *receptionButton in self.recepientHoursButtons) {
        [self setupButtonUI:receptionButton];
        
    }
    [self setupButtonUI:self.moreReceptionHoursButton];
    
    for (int i = 0; i < doctor.receptionTimes.count && i < 5; i++) {
        UIButton *button = self.recepientHoursButtons[i];
        button.hidden = NO;
        NSDate *receptionTime = [doctor.receptionTimes[i] time];
        NSDateFormatter *formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"HH:mm"];
        NSString *receptionTimeString = [formatter stringFromDate:receptionTime];
        [button setTitle:receptionTimeString forState:UIControlStateNormal];
    }
    if (doctor.receptionTimes.count > 5) {
        self.moreReceptionHoursButton.hidden = NO;
    }
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:day];
    NSDateFormatter *formatter = [NSDateFormatter new];
    
    // Date
    self.numberLabel.text = @(components.day).stringValue;
    self.mounthLabel.text = formatter.monthSymbols[components.month - 1];
    self.weekdayLabel.text = [self weekdaysDict][@(components.weekday)];
    
    // Hospital & Doctor
    self.clinicNameLabel.text = doctor.clinic.name;
    self.clinicAddressLabel.text = doctor.clinic.address;
    self.doctorNameLabel.text = doctor.name;
}

- (void)setupButtonUI:(UIButton *)button {
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    button.layer.cornerRadius = 5.0;
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
}

#pragma mark - Accessors
- (NSArray *)recepientHoursButtons {
    return @[self.recepientHours1,
             self.recepientHours2,
             self.recepientHours3,
             self.recepientHours4,
             self.recepientHours5
             ];
}

#pragma mark - Helpers
- (NSDictionary *)weekdaysDict {
    return @{ @(1) : @"Вс",
              @(2) : @"Пн",
              @(3) : @"Вт",
              @(4) : @"Ср",
              @(5) : @"Чт",
              @(6) : @"Пт",
              @(7) : @"Сб"};
}

@end