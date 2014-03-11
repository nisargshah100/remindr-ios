//
//  AuthenticationViewController.m
//  Remindr
//
//  Created by Nisarg Shah on 9/28/13.
//  Copyright (c) 2013 Nisarg Shah. All rights reserved.
//

#import "AuthenticationViewController.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "ServerConfig.h"
#import "User.h"

@interface AuthenticationViewController ()

@end

@implementation AuthenticationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self emailField] setDelegate: self];
    [[self passwordField] setDelegate: self];
    
    if([User getUser] != NULL) {
        [self goToNextView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) goToNextView {
    [self performSegueWithIdentifier:@"ReminderListViewSegue" sender:self];
}

- (IBAction)login:(id)sender {
    if([self validateAccountDetails]) {
        
        NSString *url = [[ServerConfig sharedInstance] urlWithAppendingString:@"sessions"];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        NSDictionary *params = @{
            @"user[email]": [_emailField text],
            @"user[password]": [_passwordField text]
        };
        
        [manager POST:url parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              
              NSDictionary *userData = [responseObject objectForKey:@"user"];

              User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[AppDelegate context]];
              
              user.email = [userData objectForKey:@"email"];
              user.time_zone = [userData objectForKey:@"time_zone"];
              user.authentication_token = [userData objectForKey:@"authentication_token"];
              user.phone = [userData objectForKey:@"phone"];

              NSError *error;
              if(![[AppDelegate context] save:&error]) {
                  
                  UIAlertView* dialog = [[UIAlertView alloc] init];
                  [dialog setDelegate:self];
                  [dialog setTitle:@"Woops"];
                  [dialog setMessage:@"Unable to save the user information"];
                  [dialog addButtonWithTitle:@"OK"];
                  [dialog show];
                  
              }
              else {
                  [self goToNextView];
              }
              
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            UIAlertView* dialog = [[UIAlertView alloc] init];
            [dialog setDelegate:self];
            [dialog setTitle:@"Woops"];
            [dialog setMessage:@"Invalid email or password"];
            [dialog addButtonWithTitle:@"OK"];
            [dialog show];
            
        }];
        
    }
}

- (IBAction)createAccount:(id)sender {
    if([self validateAccountDetails]) {
        
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (Boolean) validateAccountDetails {
    if([[_emailField text] isEqual:@""] || [[_passwordField text] isEqual:@""]) {
        
        UIAlertView* dialog = [[UIAlertView alloc] init];
        [dialog setDelegate:self];
        [dialog setTitle:@"Woops"];
        [dialog setMessage:@"Both email and password are required"];
        [dialog addButtonWithTitle:@"OK"];
        [dialog show];
        
        return false;
    }
    
    return true;
}

@end
