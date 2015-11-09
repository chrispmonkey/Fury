//
//  SignUpViewController.m
//  Fury
//
//  Created by Christopher L. Price on 11/4/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

UITextField *signUpActiveField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.emailTextField.delegate = self;
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.phoneNumberTextField.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    [self registerForKeyboardNotifications];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)signUpButtonPressed:(id)sender {
    NSLog(@"Sign up button pressed");
    
    FUIAlertView * betaAlert =[[FUIAlertView alloc ] initWithTitle:@"Sorry 😢"
                                                           message:@"This function is not available in Beta."
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles: nil];
    betaAlert.tag = 101;
    betaAlert.titleLabel.textColor = [UIColor silverColor];
    betaAlert.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    betaAlert.messageLabel.textColor = [UIColor silverColor];
    betaAlert.messageLabel.font = [UIFont flatFontOfSize:14];
    betaAlert.backgroundOverlay.backgroundColor = [[UIColor silverColor] colorWithAlphaComponent:0.8];
    betaAlert.alertContainer.backgroundColor = [UIColor pomegranateColor];
    betaAlert.defaultButtonColor = [UIColor silverColor];
    betaAlert.defaultButtonShadowColor = [UIColor asbestosColor];
    betaAlert.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
    betaAlert.defaultButtonTitleColor = [UIColor asbestosColor];
    
    [betaAlert show];

}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    signUpActiveField = textField;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    [self.view endEditing:YES];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    signUpActiveField = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField==self.usernameTextField){
        [self.passwordTextField becomeFirstResponder];
    }else if (textField == self.passwordTextField)
    {
        [textField resignFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    return YES;
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    //self.scrollView.contentInset = contentInsets;
    //self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, signUpActiveField.frame.origin) ) {
        //[self.scrollView scrollRectToVisible:activeField.frame animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    //self.scrollView.contentInset = contentInsets;
    //self.scrollView.scrollIndicatorInsets = contentInsets;
}

-(void)dismissKeyboard {
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

@end
