//
//  NADDoctorTableViewCell.h
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NADDoctorModel.h"

@interface NADDoctorTableViewCell : UITableViewCell

- (void)setupWithDay:(NSDate *)day doctor:(NADDoctorModel *)doctor;

@end