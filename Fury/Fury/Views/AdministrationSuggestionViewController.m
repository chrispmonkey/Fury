//
//  AdministrationSuggestionViewController.m
//  Fury
//
//  Created by Christopher L. Price on 11/8/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "AdministrationSuggestionViewController.h"
#import "SelectedTableViewCell.h"
#import "ViewVideoViewController.h"

@interface AdministrationSuggestionViewController ()
{
    NSMutableArray *administrationCellArray;
    NSMutableArray *administrationUrlArray;
    NSInteger administrationIndex;
}
@end

@implementation AdministrationSuggestionViewController

@synthesize header;
@synthesize subtitle;
@synthesize image;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (image) {
        [self setHeaderImage:image];
    }else{
        [self setHeaderImage:[UIImage imageNamed:@"defaultAdministration.jpg"]];
    }
    
    [self setTitleText:header];
    [self setSubtitleText:subtitle];
    
    [self refreshNewData];
}

- (void)refreshNewData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //[arrayOne removeAllObjects];
        [administrationCellArray removeAllObjects];
        [administrationUrlArray removeAllObjects];
        
        //arrayOne = [[NSMutableArray alloc]init];
        administrationCellArray = [[NSMutableArray alloc] init];
        administrationUrlArray = [[NSMutableArray alloc] init];
        //[arrayOne addObject:[NSString stringWithFormat:@"Title %d",i]];
        // Fill arrays with fake data for demonstration purposes
        
        [administrationCellArray addObject:[NSString stringWithFormat:@"View website"]];
        [administrationCellArray addObject:[NSString stringWithFormat:@"Projected Utilization: 15 minutes"]];
        [administrationCellArray addObject:[NSString stringWithFormat:@"View article summary"]];
        [administrationCellArray addObject:[NSString stringWithFormat:@"Watch how to do it"]];
        [administrationUrlArray addObject:[NSString stringWithFormat:@"http://www.usatoday.com/story/money/2015/10/28/report-ibm-close-buying-weather-cos-digital-assets-data/74730126/"]];
        [administrationUrlArray addObject:[NSString stringWithFormat:@"https://ca.finance.yahoo.com/administration/did-market-respond-under-armour-140504085.html"]];
        [administrationUrlArray addObject:[NSString stringWithFormat:@"http://inside.chick-fil-a.com/mobile-payment-pilots-mobile-ordering/"]];
        [administrationUrlArray addObject:[NSString stringWithFormat:@"http://www.pradministrationwire.com/administration-releases/southwire-expanding-high-voltage-cable-production-with-purchase-of-manufacturing-facility-in-huntersville-north-carolina-300108844.html"]];
        
        // Get administration index from Title
        if ([header isEqualToString:@"SDP Update"]) {
            administrationIndex = 0;
        }else if ([header isEqualToString:@"Update Contact"]) {
            administrationIndex = 1;
        }else if ([header isEqualToString:@"Renewal"]) {
            administrationIndex = 2;
        }else if ([header isEqualToString:@"Scoping Call"]) {
            administrationIndex = 3;
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
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", [administrationUrlArray objectAtIndex:administrationIndex]]];
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
    }if (indexPath.row == 3) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // present article summary ViewReportNavigationController
        UINavigationController *navController = [storyboard instantiateViewControllerWithIdentifier:@"ViewVideoNavigationController"];
        
        ViewVideoViewController *viewReportViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewVideoViewController"];
        
        //NSString *fileName = @"video";
        //viewReportViewController.reportFileName = [NSString stringWithFormat:@"%@", fileName];
        //[navController initWithRootViewController:viewReportViewController];
        
        [self showViewController:navController sender:self];
    }
}
/*
- (void)playVideoWithId:(NSString *)videoId {
    
    
    
    //UIWebView *videoView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    self.webView.backgroundColor = [UIColor clearColor];
    self.webView.opaque = NO;
    //videoView.delegate = self;
    //[self.view addSubview:videoView];
    
    self.webView.scrollView.scrollEnabled = NO;
    self.webView.scrollView.bounces = NO;
    
    self.webView.mediaPlaybackRequiresUserAction = NO;
    
    [self.webView loadHTMLString:html baseURL:[[NSBundle mainBundle] resourceURL]];
}
*/

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [administrationCellArray count]; //helps for testing scrolling on iPad
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
        
        //cell.title.text = [administrationCellArray objectAtIndex:indexPath.row];
        //cell.description.text = @"";
        UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:20];
        [cell.textLabel setFont:font];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.tintColor = [UIColor clearColor];
        UIImage *cellIcon = [UIImage imageNamed:@"tinyFuryIcon.png"];
        cell.imageView.image = cellIcon;
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[administrationCellArray objectAtIndex:indexPath.row]];
        cell.detailTextLabel.text = @"";
        tableView.rowHeight = 64;
        return cell;
        //return [super tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }
    
    return cell;
}

- (CGFloat)horizontalOffset{
    //self.tableView.rowHeight = 64
    return 64.0f;
}

- (void)didTapHeaderImageView:(UIImageView *)imageView
{
    NSLog(@"The header imageview was tapped: %@", imageView.description);
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



- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)actionButtonPressed:(id)sender
{
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
