//
//  ServerConfig.m
//  Remindr
//
//  Created by Nisarg Shah on 9/28/13.
//  Copyright (c) 2013 Nisarg Shah. All rights reserved.
//

#import "ServerConfig.h"

@implementation ServerConfig

+ (id)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (NSString *) urlWithAppendingString:(NSString *)appendingString
{
    NSString *url = @"http://remindr.me/api/";
    return [url stringByAppendingString:appendingString];
}

@end
