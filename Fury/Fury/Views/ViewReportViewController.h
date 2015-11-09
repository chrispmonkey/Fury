//
//  ViewReportViewController.h
//  Fury
//
//  Created by Christopher L. Price on 11/9/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "FlatUIKit.h"

@interface ViewReportViewController : UIViewController<MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, UIWebViewDelegate>

@property (strong, nonatomic) NSString *reportFileName;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)backButtonPressed:(id)sender;
- (IBAction)refreshViewButtonPressed:(id)sender;
- (IBAction)actionButtonPressed:(id)sender;
@end
