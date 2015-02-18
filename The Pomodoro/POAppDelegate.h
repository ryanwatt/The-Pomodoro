//
//  POAppDelegate.h
//  The Pomodoro
//
//  Created by Joshua Howland on 6/3/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface POAppDelegate : UIResponder <UIApplicationDelegate, UITabBarDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

-(void)switchTab;

@end
