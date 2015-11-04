//
//  AppDelegate.m
//  Fury
//
//  Created by Christopher L. Price on 11/3/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "AppDelegate.h"
#import "EngagementAgent.h"
#import "AEReachModule.h"



#import "HubInfo.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.client = [MSClient clientWithApplicationURLString:@"https://fury.azure-mobile.net/"
                                            applicationKey:@"FXcSHhnfsSZhRPFldmpOKRmXvcbiWk61"];

    // Register application to recieve push notifications
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert) categories:nil]];
        [application registerForRemoteNotifications];
    }
    else {
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    }
    
//    // Azure Initialize Engagement SDK
//    [EngagementAgent init:@"Endpoint=Fury-Collection.device.mobileengagement.windows.net;SdkKey=f86f5f633b177854b30cb9992c6b13d1;AppId=cuc000047"];
//    
    //AEReachModule* reach = [AEReachModule moduleWithNotificationIcon:[UIImage imageNamed:@"icon.png"]];
    
    //[reach setAutoBadgeEnabled:YES];
    
    /*
    If you want to use the option Update badge value in Reach campaigns or if you want to use native push </SaaS/Reach API/Campaign format/Native Push> campaigns, you must let the Reach module manage the badge icon itself (it will automatically clear the application badge and also reset the value stored by Engagement every time the application is started or foregrounded). This is done by adding the following line after Reach module initialization: [reach setAutoBadgeEnabled:YES];
     
     If you want to handle Reach data push, you must let your Application delegate conform to the AEReachDataPushDelegate protocol. Add the following line after Reach module initialization: [reach setDataPushDelegate:self];
     */
    //[EngagementAgent init:@"Endpoint={YOUR_APP_COLLECTION.DOMAIN};SdkKey={YOUR_SDK_KEY};AppId={YOUR_APPID}" modules:reach, nil];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
