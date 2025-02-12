//
//  ProfileViewController.h
//  Fury
//
//  Created by Christopher L. Price on 11/4/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"

@interface ProfileViewController : UIViewController<FUIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *profilePicImageView;
@property (weak, nonatomic) IBOutlet UILabel *userFirstNameLastName;
@property (weak, nonatomic) IBOutlet UILabel *userRole;
@end
