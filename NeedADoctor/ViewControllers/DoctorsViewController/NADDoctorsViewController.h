//
//  NADDoctorsViewController.h
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NADSpecializationModel.h"

@interface NADDoctorsViewController : UIViewController

@property (nonatomic) NSArray *daysOfDoctors;
@property (nonatomic) NADSpecializationModel *specialization;

@end