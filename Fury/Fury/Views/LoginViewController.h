//
//  LoginViewController.h
//  Fury
//
//  Created by Christopher L. Price on 11/4/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate, FUIAlertViewDelegate>

@property (strong, nonatomic) MSClient *client;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)loginButtonPressed:(id)sender;
- (IBAction)signUpButtonPressed:(id)sender;
- (IBAction)privacyPolicyButtonPressed:(id)sender;

@end
