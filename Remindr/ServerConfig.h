//
//  ServerConfig.h
//  Remindr
//
//  Created by Nisarg Shah on 9/28/13.
//  Copyright (c) 2013 Nisarg Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerConfig : NSObject

+ (id)sharedInstance;
- (NSString *) urlWithAppendingString:(NSString *)appendingString;

@end
