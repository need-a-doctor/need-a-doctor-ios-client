//
//  NADAppDelegate+NADNetwork.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/19/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADAppDelegate+NADNetwork.h"
#import <objc/runtime.h>

static NSString *const ServiceBaseURL = @"http://52.38.21.188:9000/api";
static NSTimeInterval const Timeout = 120;

@implementation NADAppDelegate (NADNetwork)

#pragma mark - Nerwork Manager
- (void)setNetworkManager:(UIRefreshControl *)networkManager {
    objc_setAssociatedObject(self, @selector(networkManager), networkManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AFHTTPSessionManager *)networkManager {
    AFHTTPSessionManager *manager = objc_getAssociatedObject(self, @selector(networkManager));
    if (!manager) {
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:ServiceBaseURL]];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = Timeout;
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return manager;
}

@end