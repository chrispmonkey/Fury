//
//  ViewReportViewController.m
//  Fury
//
//  Created by Christopher L. Price on 11/9/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "ViewVideoViewController.h"

@interface ViewVideoViewController ()

@end

@implementation ViewVideoViewController

@synthesize webView;
@synthesize reportFileName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webView.delegate = self;
    
    
    NSString *youTubeVideoHTML = @"<html><head><style>body{margin:0px 0px 0px 0px;}</style></head> <body> <div id=\"player\"></div> <script> var tag = document.createElement('script'); tag.src = 'http://www.youtube.com/player_api'; var firstScriptTag = document.getElementsByTagName('script')[0]; firstScriptTag.parentNode.insertBefore(tag, firstScriptTag); var player; function onYouTubePlayerAPIReady() { player = new YT.Player('player', { width:'1000', height:'520', videoId:'%@', events: { 'onReady': onPlayerReady } }); } function onPlayerReady(event) {  } </script> </body> </html>";
    
    NSString *videoId =@"dSN0HeI3Tto";
    NSString *html = [NSString stringWithFormat:youTubeVideoHTML, videoId];
    
    //UIWebView *videoView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    self.webView.backgroundColor = [UIColor clearColor];
    self.webView.opaque = NO;
    //videoView.delegate = self;
    //[self.view addSubview:videoView];
    self.webView.scalesPageToFit = YES;
    [webView sizeToFit];
    self.webView.scrollView.scrollEnabled = NO;
    webView.scrollView.bounces = NO;
    
    self.webView.mediaPlaybackRequiresUserAction = NO;
    
    [self.webView loadHTMLString:html baseURL:[[NSBundle mainBundle] resourceURL]];
    
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

- (IBAction)refreshViewButtonPressed:(id)sender
{
    [webView reload];
}

- (IBAction)actionButtonPressed:(id)sender
{
    // Bring up a pop up that filter lawyers by their specialty
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
            
            NSString *file = [NSString stringWithFormat:@"%@.pdf",self.reportFileName];
            
            // Determine the file name and extension
            NSArray *filepart = [file componentsSeparatedByString:@"."];
            NSString *filename = [filepart objectAtIndex:0];
            NSString *extension = [filepart objectAtIndex:1];
            
            // Get the resource path and read the file using NSData
            NSString *filePath = [[NSBundle mainBundle] pathForResource:reportFileName ofType:@"pdf"];
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
            [mail addAttachmentData:fileData mimeType:mimeType fileName:@"report.pdf"];
            
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
