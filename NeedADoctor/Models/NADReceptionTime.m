//
//  NADReceptionTime.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADReceptionTime.h"

@implementation NADReceptionTime

#pragma mark - Mantle
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"time" : @"time",
             @"isBusy" : @"isBusy",
             @"isCurrentUser" : @"isCurrentUser"
             };
}

+ (NSValueTransformer *)timeJSONTransformer {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ssZ";
    
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        return [dateFormatter dateFromString:value];
    }];
}

@end