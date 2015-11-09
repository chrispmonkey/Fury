//
//  ReportsSuggestionViewController.m
//  Fury
//
//  Created by Christopher L. Price on 11/8/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "ReportsSuggestionViewController.h"

@interface ReportsSuggestionViewController ()

@end


@implementation ReportsSuggestionViewController

@synthesize header;
@synthesize subtitle;
@synthesize image;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (image) {
        [self setHeaderImage:image];
    }else{
        [self setHeaderImage:[UIImage imageNamed:@"defaultReports.png"]];
    }
    
    [self setTitleText:header];
    [self setSubtitleText:subtitle];
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

- (IBAction)backButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)actionButtonPressed:(id)sender {
    // Bring up a pop up that filter lawyers by their specialty
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Share" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Email" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Share link to news article via email
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Text Message" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Share link to news article via text message
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
