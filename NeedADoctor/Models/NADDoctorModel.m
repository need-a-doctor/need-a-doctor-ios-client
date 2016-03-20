//
//  NADDoctorModel.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADDoctorModel.h"
#import "NADSpecializationModel.h"
#import "NADReceptionTime.h"

@implementation NADDoctorModel

#pragma mark - Mantle
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name" : @"name",
             @"specializations" : @"specializations",
             @"receptionTimes" : @"receptions",
             @"clinic" : @"clinic"
             };
}

+ (NSValueTransformer *)specializationsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:NADSpecializationModel.class];
}

+ (NSValueTransformer *)receptionTimesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:NADReceptionTime.class];
}

@end