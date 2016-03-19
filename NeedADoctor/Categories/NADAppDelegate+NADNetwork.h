//
//  NADAppDelegate+NADNetwork.h
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/19/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADAppDelegate.h"
#import <AFNetworking/AFNetworking.h>

@interface NADAppDelegate (NADNetwork)

@property (nonatomic, readonly) AFHTTPSessionManager *networkManager;

@end