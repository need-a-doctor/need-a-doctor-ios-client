//
//  NADDoctorModel.h
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "NADClinic.h"

@interface NADDoctorModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NADClinic *clinic;
@property (nonatomic, readonly) NSArray *specializations;
@property (nonatomic, readonly) NSArray *receptionTimes;

@end