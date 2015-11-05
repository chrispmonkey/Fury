//
//  HomeViewController.m
//  Fury
//
//  Created by Christopher L. Price on 11/4/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self preferredStatusBarStyle];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    [self preferredStatusBarStyle];
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
// FUIALERT VIEW DELEGATES
-(void)alertView:(FUIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 100) {
        if (buttonIndex == 1) {
            NSLog(@"Shake Alert View Button Clicked");
            
            // Logout current user
            //[PFUser logOut];
            
            // Present login view controller
            //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            //UIViewController *timeLineNavigationController = [storyboard instantiateViewControllerWithIdentifier:@"LoginNavigationController"];
            //[self presentViewController:timeLineNavigationController animated:YES completion:nil];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        
    }
    else{
        
    }
}

- (void)alertView:(FUIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}

- (void)alertView:(FUIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        
        FUIAlertView * frustratedAlert =[[FUIAlertView alloc ] initWithTitle:@"Shake Detected"
                                                                     message:@"Would you like to logout?"
                                                                    delegate:self
                                                           cancelButtonTitle:@"No"
                                                           otherButtonTitles: @"Yes", nil];
        frustratedAlert.tag = 100;
        frustratedAlert.titleLabel.textColor = [UIColor silverColor];
        frustratedAlert.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        frustratedAlert.messageLabel.textColor = [UIColor silverColor];
        frustratedAlert.messageLabel.font = [UIFont flatFontOfSize:14];
        frustratedAlert.backgroundOverlay.backgroundColor = [[UIColor silverColor] colorWithAlphaComponent:0.8];
        frustratedAlert.alertContainer.backgroundColor = [UIColor pomegranateColor];
        frustratedAlert.defaultButtonColor = [UIColor silverColor];
        frustratedAlert.defaultButtonShadowColor = [UIColor asbestosColor];
        frustratedAlert.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        frustratedAlert.defaultButtonTitleColor = [UIColor asbestosColor];
        
        [frustratedAlert show];
    }
}


@end
