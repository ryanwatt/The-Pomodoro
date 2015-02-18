//
//  POAppDelegate.m
//  The Pomodoro
//
//  Created by Joshua Howland on 6/3/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "POAppDelegate.h"
#import "POTimerViewController.h"
#import "PORoundsViewController.h"


@implementation POAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    PORoundsViewController *roundsViewController = [PORoundsViewController new];
    roundsViewController.tabBarItem.title = @"Huevos";
    roundsViewController.tabBarItem.image = [UIImage imageNamed:@"rounds"];

    POTimerViewController *timerViewController = [POTimerViewController new];
    timerViewController.tabBarItem.title = @"Tiempo";
    timerViewController.tabBarItem.image = [UIImage imageNamed:@"timer"];

    self.tabBarController = [UITabBarController new];
    self.tabBarController.viewControllers = @[[[UINavigationController alloc] initWithRootViewController:roundsViewController], [[UINavigationController alloc] initWithRootViewController:timerViewController]];
    self.tabBarController.delegate = self;
    
    
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:1.0 green:0.8 blue:0.05 alpha:1]];
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:1.0 green:0.8 blue:0.05 alpha:1]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName: [UIColor whiteColor],
                                                           NSFontAttributeName: [UIFont fontWithName:@"Avenir-Light" size:20]
                                                           }];
        
    self.window.rootViewController = self.tabBarController;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)switchTab
{
    [self.tabBarController.delegate tabBarController:self.tabBarController shouldSelectViewController:[[self.tabBarController viewControllers] objectAtIndex:1]];
    [self.tabBarController setSelectedIndex:1];
    [self.tabBarController selectedViewController];
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
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert) categories:nil]];
        [application registerForRemoteNotifications];
    }else{
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationType)(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    }
}
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [[[UIAlertView alloc] initWithTitle:@"El tiempo se ha terminado." message:notification.alertBody delegate:nil cancelButtonTitle:@"Muy Bien" otherButtonTitles:nil] show];
    
    application.applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
