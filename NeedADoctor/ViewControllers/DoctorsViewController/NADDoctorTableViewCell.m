//
//  NADDoctorTableViewCell.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADDoctorTableViewCell.h"

@interface NADDoctorTableViewCell ()

// Date
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *mounthLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekdayLabel;

// Hospital & Doctor
@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *doctorNameLabel;

// Reception time
@property (weak, nonatomic) IBOutlet UIButton *receptionTime1;
@property (weak, nonatomic) IBOutlet UIButton *receptionTime2;
@property (weak, nonatomic) IBOutlet UIButton *receptionTime3;
@property (weak, nonatomic) IBOutlet UIButton *receptionTime4;
@property (weak, nonatomic) IBOutlet UIButton *receptionTime5;

@property (weak, nonatomic) IBOutlet UIButton *moreReceptionTime;

// Day & Doctor models
@property (nonatomic) NSDate *day;
@property (nonatomic) NADDoctorModel *doctor;

@end

@implementation NADDoctorTableViewCell

#pragma mark - Setups
- (void)setupWithDay:(NSDate *)day doctor:(NADDoctorModel *)doctor {
    self.day = day;
    self.doctor = doctor;
    
    // Borders
    for (UIButton *receptionButton in self.receptionTimeButtons) {
        [self setupButtonUI:receptionButton];
        
    }
    [self setupButtonUI:self.moreReceptionTime];
    
    for (int i = 0; i < doctor.receptionTimes.count && i < 5; i++) {
        UIButton *button = self.receptionTimeButtons[i];
        button.hidden = NO;
        NSDate *receptionTime = [doctor.receptionTimes[i] time];
        NSDateFormatter *formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"HH:mm"];
        NSString *receptionTimeString = [formatter stringFromDate:receptionTime];
        [button setTitle:receptionTimeString forState:UIControlStateNormal];
    }
    if (doctor.receptionTimes.count > 5) {
        self.moreReceptionTime.hidden = NO;
    }
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:day];
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
- (NSArray *)receptionTimeButtons {
    return @[self.receptionTime1,
             self.receptionTime2,
             self.receptionTime3,
             self.receptionTime4,
             self.receptionTime5
             ];
}

#pragma mark - User interaction
- (IBAction)receptionTimeButtonTap:(UIButton *)sender {
    NSUInteger index = [self.receptionTimeButtons indexOfObject:sender];
    NADReceptionTime *receptionTime = self.doctor.receptionTimes[index];
    if ([self.delegate respondsToSelector:@selector(receptionTimeDidTapped:)]) {
        [self.delegate receptionTimeDidTapped:receptionTime];
    }
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