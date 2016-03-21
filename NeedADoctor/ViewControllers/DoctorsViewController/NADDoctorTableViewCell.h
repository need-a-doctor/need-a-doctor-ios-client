//
//  NADDoctorTableViewCell.h
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NADDoctorModel.h"
#import "NADReceptionTime.h"

@protocol NADDoctorTableViewProtocol <NSObject>

- (void)receptionTimeDidTapped:(NADReceptionTime *)receptionTime;

@end


@interface NADDoctorTableViewCell : UITableViewCell

- (void)setupWithDay:(NSDate *)day doctor:(NADDoctorModel *)doctor delegate:(id<NADDoctorTableViewProtocol>)delegate;

@end