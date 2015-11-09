//
//  SettingsTableViewController.m
//  Fury
//
//  Created by Christopher L. Price on 11/6/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "SettingsTableViewController.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"You selected row: %ld", (long)indexPath.row);
    
    if (indexPath.row == 1) {
        // present web browser view with url of site
        NSLog(@"Add edit utilization goal selected");
        //UINavigationController *navController;
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

    }if (indexPath.row == 2) {
        NSLog(@"Add edit customers selected");
        //UINavigationController *navController;
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
    }if (indexPath.row == 3) {
        // present article summary
        NSLog(@"Favorites selected");
        //UINavigationController *navController;
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
    }if (indexPath.row == 4)
    {
        NSLog(@"Contact us selected");
        // Share link to news article via email
        if ([MFMailComposeViewController canSendMail]) {
            
            MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
            mail.mailComposeDelegate = self;
            [mail setSubject:@"Feedback/Support about Fury"];
            [mail setMessageBody:@"\n\n\nSent from Fury" isHTML:NO];
            [mail setToRecipients:@[@""]];
            
            [self presentViewController:mail animated:YES completion:NULL];
        }
        else
        {
            NSLog(@"This device cannot send email");
        }

    }


}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
