//
//  User.h
//  Remindr
//
//  Created by Nisarg Shah on 9/28/13.
//  Copyright (c) 2013 Nisarg Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * authentication_token;
@property (nonatomic, retain) NSString * time_zone;

+ (NSArray *) fetch;
+ (User *) getUser;

@end
