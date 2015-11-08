//
//  HomeViewController.h
//  Fury
//
//  Created by Christopher L. Price on 11/4/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"
#import "PSCollectionView.h"
#import "SRRefreshView.h"
#import "GHContextMenuView.h"


@interface HomeViewController : UIViewController<UITextFieldDelegate, FUIAlertViewDelegate,UIScrollViewDelegate,PSCollectionViewDataSource,PSCollectionViewDelegate, SRRefreshDelegate, GHContextOverlayViewDataSource, GHContextOverlayViewDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) PSCollectionView *waterFLowView;
@property (strong, nonatomic) SRRefreshView *slimeView;

- (IBAction)menuButtonPressed:(id)sender;

@end
