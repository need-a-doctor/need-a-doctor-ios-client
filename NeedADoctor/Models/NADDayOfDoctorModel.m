//
//  NADDayOfDoctorModel.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADDayOfDoctorModel.h"
#import "NADDoctorModel.h"

@implementation NADDayOfDoctorModel

#pragma mark - Mantle
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"date" : @"date",
             @"doctors" : @"doctors"
             };
}

+ (NSValueTransformer *)dateJSONTransformer {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ssZ";
    
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        return [dateFormatter dateFromString:value];
    }];
}

+ (NSValueTransformer *)specializationsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:NADDoctorModel.class];
}

@end