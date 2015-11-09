//
//  WorkshopsSuggestionViewController.m
//  Fury
//
//  Created by Christopher L. Price on 11/8/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "WorkshopsSuggestionViewController.h"
#import "SelectedTableViewCell.h"

@interface WorkshopsSuggestionViewController ()
{
    NSMutableArray *workshopsCellArray;
    NSMutableArray *workshopsUrlArray;
    NSInteger workshopsIndex;
}
@end

@implementation WorkshopsSuggestionViewController

@synthesize header;
@synthesize subtitle;
@synthesize image;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (image) {
        [self setHeaderImage:image];
    }else{
        [self setHeaderImage:[UIImage imageNamed:@"defaultWorkshops.jpg"]];
    }
    
    [self setTitleText:header];
    
    [self setSubtitleText:subtitle];
    
    [self refreshNewData];
}

- (void)refreshNewData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //[arrayOne removeAllObjects];
        [workshopsCellArray removeAllObjects];
        [workshopsUrlArray removeAllObjects];
        
        //arrayOne = [[NSMutableArray alloc]init];
        workshopsCellArray = [[NSMutableArray alloc] init];
        workshopsUrlArray = [[NSMutableArray alloc] init];
        //[arrayOne addObject:[NSString stringWithFormat:@"Title %d",i]];
        // Fill arrays with fake data for demonstration purposes
        
        [workshopsCellArray addObject:[NSString stringWithFormat:@"View website"]];
        [workshopsCellArray addObject:[NSString stringWithFormat:@"Projected Utilization: 15 minutes"]];
        [workshopsCellArray addObject:[NSString stringWithFormat:@"View article summary"]];
        
        [workshopsUrlArray addObject:[NSString stringWithFormat:@"http://www.usatoday.com/story/money/2015/10/28/report-ibm-close-buying-weather-cos-digital-assets-data/74730126/"]];
        [workshopsUrlArray addObject:[NSString stringWithFormat:@"https://ca.finance.yahoo.com/workshops/did-market-respond-under-armour-140504085.html"]];
        [workshopsUrlArray addObject:[NSString stringWithFormat:@"http://inside.chick-fil-a.com/mobile-payment-pilots-mobile-ordering/"]];
        [workshopsUrlArray addObject:[NSString stringWithFormat:@"http://www.prworkshopswire.com/workshops-releases/southwire-expanding-high-voltage-cable-production-with-purchase-of-manufacturing-facility-in-huntersville-north-carolina-300108844.html"]];
        
        // Get workshops index from Title
        if ([header isEqualToString:@"SCCM 2012"]) {
            workshopsIndex = 0;
        }else if ([header isEqualToString:@"ADFS"]) {
            workshopsIndex = 1;
        }else if ([header isEqualToString:@"Skype for Business"]) {
            workshopsIndex = 2;
        }else if ([header isEqualToString:@"SQL Server"]) {
            workshopsIndex = 3;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableView reloadData];
            
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"You selected row: %ld", (long)indexPath.row);
    
    if (indexPath.row == 0) {
        // present web browser view with url of site
        NSLog(@"Present webview selected");
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", [workshopsUrlArray objectAtIndex:workshopsIndex]]];
        SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:url];
        //safariViewController.view.backgroundColor = [UIColor redColor];//[UIColor colorWithRed:149 green:38 blue:42 alpha:1];
        safariViewController.view.tintColor = [UIColor redColor];//[UIColor colorWithRed:149 green:38 blue:42 alpha:1];
        safariViewController.navigationController.navigationBar.tintColor = [UIColor redColor];
        safariViewController.navigationController.navigationBar.backgroundColor = [UIColor redColor];
        [self showDetailViewController:safariViewController sender:self];
        
    }if (indexPath.row == 1) {
        // present web browser view with url of site
        NSLog(@"Projected Utilization selected");
        //UINavigationController *navController;
        
        UITableViewCell * cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.selected = YES;
        
        FUIAlertView * utilizationAlert =[[FUIAlertView alloc ] initWithTitle:@"Utilization"
                                                                      message:@"Would you like to add this to your utilization estimate?"
                                                                     delegate:self
                                                            cancelButtonTitle:@"No"
                                                            otherButtonTitles: @"Yes", nil];
        utilizationAlert.tag = 100;
        utilizationAlert.titleLabel.textColor = [UIColor silverColor];
        utilizationAlert.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        utilizationAlert.messageLabel.textColor = [UIColor silverColor];
        utilizationAlert.messageLabel.font = [UIFont flatFontOfSize:14];
        utilizationAlert.backgroundOverlay.backgroundColor = [[UIColor silverColor] colorWithAlphaComponent:0.8];
        utilizationAlert.alertContainer.backgroundColor = [UIColor pomegranateColor];
        utilizationAlert.defaultButtonColor = [UIColor silverColor];
        utilizationAlert.defaultButtonShadowColor = [UIColor asbestosColor];
        utilizationAlert.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        utilizationAlert.defaultButtonTitleColor = [UIColor asbestosColor];
        
        [utilizationAlert show];
        
        
        
    }if (indexPath.row == 2) {
        // present article summary
        NSLog(@"Article summary selected");
        //UINavigationController *navController;
        FUIAlertView * utilizationAlert =[[FUIAlertView alloc ] initWithTitle:@"Sorry 😢"
                                                                      message:@"This function is not available in Beta."
                                                                     delegate:self
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles: nil];
        utilizationAlert.tag = 101;
        utilizationAlert.titleLabel.textColor = [UIColor silverColor];
        utilizationAlert.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        utilizationAlert.messageLabel.textColor = [UIColor silverColor];
        utilizationAlert.messageLabel.font = [UIFont flatFontOfSize:14];
        utilizationAlert.backgroundOverlay.backgroundColor = [[UIColor silverColor] colorWithAlphaComponent:0.8];
        utilizationAlert.alertContainer.backgroundColor = [UIColor pomegranateColor];
        utilizationAlert.defaultButtonColor = [UIColor silverColor];
        utilizationAlert.defaultButtonShadowColor = [UIColor asbestosColor];
        utilizationAlert.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        utilizationAlert.defaultButtonTitleColor = [UIColor asbestosColor];
        
        [utilizationAlert show];
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3; //helps for testing scrolling on iPad
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"SelectedCellTableCell";
    SelectedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (tableView == self.tableView) { // This call refers to the one talbe that is managed by super
        
        //NSString *cellIdentifier = @"SelectedCellTableCell";
        
        UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
        
        //cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        //UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
        
        //cell.title.text = [workshopsCellArray objectAtIndex:indexPath.row];
        //cell.description.text = @"";
        UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:20];
        [cell.textLabel setFont:font];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.tintColor = [UIColor clearColor];
        UIImage *cellIcon = [UIImage imageNamed:@"tinyFuryIcon.png"];
        cell.imageView.image = cellIcon;
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[workshopsCellArray objectAtIndex:indexPath.row]];
        cell.detailTextLabel.text = @"";
        tableView.rowHeight = 64;
        return cell;
        //return [super tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }
    
    return cell;
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 //NSString *CellIdentifier = @"SelectedCellTableCell";
 //SelectedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 NSString *CellIdentifier = @"Cell";
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 if (cell == nil) {
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
 }
 
 
 //    cell.title.text = @"hi";
 //    cell.description.text = @"Description";
 
 //[cell.textLabel setText:[workshopsCellArray objectAtIndex:indexPath.row]];
 cell.textLabel.text = [workshopsCellArray objectAtIndex:indexPath.row];
 cell.detailTextLabel.text = @"Please...";
 return cell;
 }
 */

- (CGFloat)horizontalOffset{
    //self.tableView.rowHeight = 64
    return 64.0f;
}

- (void)didTapHeaderImageView:(UIImageView *)imageView
{
    NSLog(@"The header imageview was tapped: %@", imageView.description);
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

- (IBAction)actionButtonPressed:(id)sender
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Share" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Email" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Share link to workshops article via email
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Text Message" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Share link to workshops article via text message
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

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
            //[self dismissViewControllerAnimated:YES completion:nil];
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

@end
