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
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    // Always use this locale when parsing fixed format date strings
    NSLocale *posix = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:posix];
    
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        return [dateFormatter dateFromString:value];
    }];
}

+ (NSValueTransformer *)doctorsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:NADDoctorModel.class];
}

@end