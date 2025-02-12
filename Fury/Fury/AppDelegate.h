//
//  AppDelegate.h
//  Fury
//
//  Created by Christopher L. Price on 11/3/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MSClient *client;

@end

