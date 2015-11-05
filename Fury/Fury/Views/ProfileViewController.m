//
//  ProfileViewController.m
//  Fury
//
//  Created by Christopher L. Price on 11/4/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

NSString* firstName;
NSString* lastName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self preferredStatusBarStyle];
    
    // Round Profile Image
    // Get the Layer of any view
    CALayer * l = [self.profilePicImageView layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:self.profilePicImageView.frame.size.width / 2];
    
    firstName = @"Christopher";
    lastName = @"Price";
    
    self.title=[NSString stringWithFormat:@"%@", firstName];
    
    self.userFirstNameLastName.text = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
