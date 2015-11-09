//
//  ReportsSuggestionViewController.m
//  Fury
//
//  Created by Christopher L. Price on 11/8/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "ReportsSuggestionViewController.h"
#import "SelectedTableViewCell.h"
#import "ViewReportViewController.h"

@interface ReportsSuggestionViewController ()
{
    NSMutableArray *reportsCellArray;
    NSMutableArray *reportsUrlArray;
    NSInteger reportsIndex;
}
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
    
    [self refreshNewData];
}

- (void)refreshNewData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //[arrayOne removeAllObjects];
        [reportsCellArray removeAllObjects];
        [reportsUrlArray removeAllObjects];
        
        //arrayOne = [[NSMutableArray alloc]init];
        reportsCellArray = [[NSMutableArray alloc] init];
        reportsUrlArray = [[NSMutableArray alloc] init];
        //[arrayOne addObject:[NSString stringWithFormat:@"Title %d",i]];
        // Fill arrays with fake data for demonstration purposes
        
        [reportsCellArray addObject:[NSString stringWithFormat:@"View report"]];
        [reportsCellArray addObject:[NSString stringWithFormat:@"Projected Utilization: 15 minutes"]];
        [reportsCellArray addObject:[NSString stringWithFormat:@"View article summary"]];
        
        [reportsUrlArray addObject:[NSString stringWithFormat:@"http://www.usatoday.com/story/money/2015/10/28/report-ibm-close-buying-weather-cos-digital-assets-data/74730126/"]];
        [reportsUrlArray addObject:[NSString stringWithFormat:@"https://ca.finance.yahoo.com/reports/did-market-respond-under-armour-140504085.html"]];
        [reportsUrlArray addObject:[NSString stringWithFormat:@"http://inside.chick-fil-a.com/mobile-payment-pilots-mobile-ordering/"]];
        [reportsUrlArray addObject:[NSString stringWithFormat:@"http://www.prreportswire.com/reports-releases/southwire-expanding-high-voltage-cable-production-with-purchase-of-manufacturing-facility-in-huntersville-north-carolina-300108844.html"]];
        
        // Get reports index from Title
        if ([header isEqualToString:@"Services Review"]) {
            reportsIndex = 0;
        }else if ([header isEqualToString:@"Case Reviews"]) {
            reportsIndex = 1;
        }else if ([header isEqualToString:@"IT Health"]) {
            reportsIndex = 2;
        }else if ([header isEqualToString:@"Products Review"]) {
            reportsIndex = 3;
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
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    if (indexPath.row == 0) {
        // present web browser view with url of site
        NSLog(@"Present webview selected");
       
        UINavigationController *navController = [storyboard instantiateViewControllerWithIdentifier:@"ViewReportNavigationController"];
        
        ViewReportViewController *viewReportViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewReportViewController"];
        
        NSString *fileName = @"Customer Facing Report NASCO";
        viewReportViewController.reportFileName = [NSString stringWithFormat:@"%@", fileName];
        //[navController initWithRootViewController:viewReportViewController];
        
        [self showViewController:navController sender:self];
        
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
        
        //cell.title.text = [reportsCellArray objectAtIndex:indexPath.row];
        //cell.description.text = @"";
        UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:20];
        [cell.textLabel setFont:font];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.tintColor = [UIColor clearColor];
        UIImage *cellIcon = [UIImage imageNamed:@"tinyFuryIcon.png"];
        cell.imageView.image = cellIcon;
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[reportsCellArray objectAtIndex:indexPath.row]];
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

- (IBAction)backButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)actionButtonPressed:(id)sender {
    // Bring up a pop up that filter lawyers by their specialty
    NSString *fileName = @"Customer Facing Report NASCO";
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Share Report" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Email" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Share link to news article via email
        if ([MFMailComposeViewController canSendMail]) {
            
            MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
            mail.mailComposeDelegate = self;
            [mail setSubject:@"Report"];//, [newsCellArray objectAtIndex:0]]];
            [mail setMessageBody:@"Check this report out: \nSent from Fury" isHTML:NO];
            [mail setToRecipients:@[@""]];
            
            NSString *file = [NSString stringWithFormat:@"%@.pdf",fileName];
            
            // Determine the file name and extension
            NSArray *filepart = [file componentsSeparatedByString:@"."];
            NSString *filename = [filepart objectAtIndex:0];
            NSString *extension = [filepart objectAtIndex:1];
            
            // Get the resource path and read the file using NSData
            NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"pdf"];
            NSData *fileData = [NSData dataWithContentsOfFile:filePath];
            
            // Determine the MIME type
            NSString *mimeType;
            if ([extension isEqualToString:@"jpg"]) {
                mimeType = @"image/jpeg";
            } else if ([extension isEqualToString:@"png"]) {
                mimeType = @"image/png";
            } else if ([extension isEqualToString:@"doc"]) {
                mimeType = @"application/msword";
            } else if ([extension isEqualToString:@"ppt"]) {
                mimeType = @"application/vnd.ms-powerpoint";
            } else if ([extension isEqualToString:@"html"]) {
                mimeType = @"text/html";
            } else if ([extension isEqualToString:@"pdf"]) {
                mimeType = @"application/pdf";
            }
            
            // Add attachment
            [mail addAttachmentData:fileData mimeType:mimeType fileName:filename];
            
            // Present mail view controller on screen
            [self presentViewController:mail animated:YES completion:NULL];
        }
        else
        {
            NSLog(@"This device cannot send email");
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Text Message" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Share link to news article via text message
        if(![MFMessageComposeViewController canSendText]) {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            return;
        }
        
        NSArray *recipents = @[@""];
        NSString *message = [NSString stringWithFormat:@"Report: \nSent from Fury"];
        
        MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
        messageController.messageComposeDelegate = self;
        [messageController setRecipients:recipents];
        [messageController setBody:message];
        
        // Present message view controller on screen
        [self presentViewController:messageController animated:YES completion:nil];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

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

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultSent:
            NSLog(@"You sent the text.");
            break;
        case MessageComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Message failed:  An error occurred when trying to compose this message");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this message");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
