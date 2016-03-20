//
//  NADDoctorTableViewCell.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADDoctorTableViewCell.h"

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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *receptionHoursButtons;
@property (weak, nonatomic) IBOutlet UIButton *moreReceptionHoursButton;

@end

@implementation NADDoctorTableViewCell

- (void)setupWithDay:(NSDate *)day doctor:(NADDoctorModel *)doctor {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:day];
    NSDateFormatter *formatter = [NSDateFormatter new];
    
    // Date
    self.numberLabel.text = @(components.day).stringValue;
    self.mounthLabel.text = formatter.monthSymbols[components.month - 1];
    self.weekdayLabel.text = formatter.weekdaySymbols[components.weekday - 1];
    
    // Hospital & Doctor
    self.clinicNameLabel.text = doctor.clinic.name;
    self.clinicAddressLabel.text = doctor.clinic.address;
    self.doctorNameLabel.text = doctor.name;
}

@end