//
//  NADReceptionTime.h
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface NADReceptionTime : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSDate *time;
@property (nonatomic) BOOL isBusy;
@property (nonatomic) BOOL isCurrentUser;

@end