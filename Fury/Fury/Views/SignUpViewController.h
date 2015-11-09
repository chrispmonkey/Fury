//
//  SignUpViewController.h
//  Fury
//
//  Created by Christopher L. Price on 11/4/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"

@interface SignUpViewController : UIViewController<UITextFieldDelegate, FUIAlertViewDelegate>

- (IBAction)backButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)signUpButtonPressed:(id)sender;
@end
