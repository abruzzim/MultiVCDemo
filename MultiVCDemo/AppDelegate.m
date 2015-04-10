//
//  AppDelegate.m
//  MultiVCDemo
//
//  Created by dev1 on 4/8/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "AppDelegate.h"
#import "ParentVC.h"
#import "ChildVC1.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Return a CGRect object representing the dimensions of the device's screen.
    CGRect viewRect = [[UIScreen mainScreen] bounds];
    
    // Report the dimensions of the main screen.
    NSLog(@"%%AppDelegate-I-DEBUG, Screen %fH x %fW.", viewRect.size.height, viewRect.size.width);
    
    /*
     Instantiate a UIWindow that is set to the bounds of the physical device's main screen.
     */
    self.window = [[UIWindow alloc] initWithFrame:viewRect];
    // self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    /*
     Instantiate custom UIViewControllers
     */
    ParentVC *parentVC = [[ParentVC alloc] init];
    ChildVC1 *childVC1 = [[ChildVC1 alloc] init];
    
    parentVC.title = @"ParentVC";
    childVC1.title = @"ChildVC1";
    
    // Instantiate navigation controllers.
    UINavigationController *parentNC = [[UINavigationController alloc] initWithRootViewController:parentVC];
    //parentNC.navigationBarHidden = YES;
    UINavigationController *child1NC = [[UINavigationController alloc] initWithRootViewController:childVC1];
    
    // Instantiate a tab bar controller.
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    // Add the navigation controller to tab bar controller
    [tabBarController setViewControllers:@[parentNC,child1NC]
                                animated:YES];
    
    /*
     Installs the view controller’s view as the content view of the window.
     */
    self.window.rootViewController = tabBarController;
    
    /*
     Make the receiver the main window and display it in front of other windows at the same window level.
     */
    [self.window makeKeyAndVisible];
    
    // Report the dimensions of the tab bar controller's view.
    NSLog(@"%%AppDelegate-I-DEBUG, Tab Bar VC View %fH x %fW.",
          tabBarController.view.frame.size.height,
          tabBarController.view.frame.size.width);
    
    // Report the dimensions of the tab bar.
    NSLog(@"%%AppDelegate-I-DEBUG, Tab Bar %fH x %fW.",
          tabBarController.tabBar.frame.size.height,
          tabBarController.tabBar.frame.size.width);
    
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
