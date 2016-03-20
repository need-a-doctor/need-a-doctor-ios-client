//
//  NADSpecializationModel.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/19/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADSpecializationModel.h"

@implementation NADSpecializationModel

#pragma mark - Mantle
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name" : @"name",
             @"descript" : @"description"
             };
}

@end