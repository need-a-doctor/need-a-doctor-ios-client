//
//  NADDayOfDoctorModel.h
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface NADDayOfDoctorModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSDate *date;
@property (nonatomic, readonly) NSArray *doctors;

@end