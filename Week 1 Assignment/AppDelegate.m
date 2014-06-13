//
//  AppDelegate.m
//  Week 1 Assignment
//
//  Created by Billy Roh on 6/11/14.
//  Copyright (c) 2014 Billy Roh. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Main View Setup
    MainViewController *viewController = [[MainViewController alloc] init];
    viewController.title = @"News Feed";

    // Navigation Controller Setup
    UINavigationController *navigationController = nil;
    navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(66.0f/255.0f) green:(98.0f/255.0f) blue:(163.0f/255.0f) alpha:1.0f];
    navigationController.navigationBar.translucent = NO;

    // Dummy tabs
    UIViewController *view2 = [[UIViewController alloc] init];
    view2.title = @"Requests";
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:view2];

    UIViewController *view3 = [[UIViewController alloc] init];
    view3.title = @"Messages";
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:view3];
    
    UIViewController *view4 = [[UIViewController alloc] init];
    view4.title = @"Notifications";
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:view4];
    
    UIViewController *view5 = [[UIViewController alloc] init];
    view5.title = @"More";
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:view5];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[navigationController, nav2, nav3, nav4, nav5];
    
    self.window.rootViewController = tabBarController;
    
//    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
//    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
//    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
//    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
//    UITabBarItem *tabBarItem5 = [tabBar.items objectAtIndex:4];
//    
//    tabBarItem1.title = @"News Feed";
//    tabBarItem2.title = @"Requests";
//    tabBarItem3.title = @"Messages";
//    tabBarItem4.title = @"Notifications";
//    tabBarItem5.title = @"More";
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
  
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
