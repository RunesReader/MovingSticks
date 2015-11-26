//
//  ARRAppDelegate.m
//  PhoneSpin
//
//  Created by Igor Arsenkin on 23.11.15.
//  Copyright © 2015 Igor Arsenkin. All rights reserved.
//

#import "ARRAppDelegate.h"

#import "ARRStartViewController.h"

#import "UIWindow+ARRWindow.h"
#import "UIViewController+ARRExtensions.h"

@implementation ARRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    window.rootViewController = [ARRStartViewController controller];
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

@end
