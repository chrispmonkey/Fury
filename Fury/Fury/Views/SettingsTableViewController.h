//
//  SettingsTableViewController.h
//  Fury
//
//  Created by Christopher L. Price on 11/6/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"
#import <MessageUI/MessageUI.h>

@interface SettingsTableViewController : UITableViewController<FUIAlertViewDelegate, MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *settingsIconImageView;
@end
