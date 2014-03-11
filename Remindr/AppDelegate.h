//
//  AppDelegate.h
//  Remindr
//
//  Created by Nisarg Shah on 9/28/13.
//  Copyright (c) 2013 Nisarg Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (NSManagedObjectContext *) context;

@end
