//
//  NewsCellSelectedViewController.h
//  Fury
//
//  Created by Christopher L. Price on 11/8/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import <ParallaxBlur/JPBFloatingTextViewController.h>
#import <SafariServices/SafariServices.h>
#import <MessageUI/MessageUI.h>
#import "FlatUIKit.h"

@interface NewsSuggestionViewController : JPBFloatingTextViewController<SFSafariViewControllerDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, FUIAlertViewDelegate>

@property (strong, nonatomic) NSString *header;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) UIImage *image;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)actionButtonPressed:(id)sender;
@end
