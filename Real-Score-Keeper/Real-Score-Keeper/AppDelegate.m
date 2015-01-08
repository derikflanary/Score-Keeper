//
//  AppDelegate.m
//  Real-Score-Keeper
//
//  Created by Derik Flanary on 1/7/15.
//  Copyright (c) 2015 Vibe. All rights reserved.
//

#import "AppDelegate.h"
#import "RSKViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    RSKViewController *mainViewController = [[RSKViewController alloc] init];
    
    self.window.rootViewController = mainViewController;
    

    
    
    
    
    
    return YES;
}

















@end
