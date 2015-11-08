//
//  SignUpViewController.h
//  Fury
//
//  Created by Christopher L. Price on 11/4/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"
#import "RMActionController.h"

@interface SignUpViewController : UIViewController<UITextFieldDelegate, FUIAlertViewDelegate>

- (IBAction)backButtonPressed:(id)sender;
@end
