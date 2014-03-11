//
//  User.m
//  Remindr
//
//  Created by Nisarg Shah on 9/28/13.
//  Copyright (c) 2013 Nisarg Shah. All rights reserved.
//

#import "User.h"

@implementation User

@dynamic id;
@dynamic email;
@dynamic phone;
@dynamic authentication_token;
@dynamic time_zone;

+ (NSArray *) fetch {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
                                                       inManagedObjectContext:[AppDelegate context]];
    [fetchRequest setEntity:entity];
    NSError* error;
    NSArray *fetchedRecords = [[AppDelegate context] executeFetchRequest:fetchRequest error:&error];
    return fetchedRecords;
}

+ (User *) getUser {
    NSArray *users = [User fetch];
    
    if([users count] > 0) {
        return [[User fetch] objectAtIndex:0];
    }
    else {
        return NULL;
    }
}

@end
