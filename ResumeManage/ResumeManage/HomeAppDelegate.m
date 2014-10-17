//
//  HomeAppDelegate.m
//  ResumeManage
//
//  Created by 单好坤 on 14-6-24.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "HomeAppDelegate.h"
#import "DefaultTempViewController.h"


#import <ShareSDK/ShareSDK.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"


@implementation HomeAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
    [[UINavigationBar appearance] setBarTintColor:RGBACOLOR(68, 102, 153, 1.0)];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    
    [ShareSDK registerApp:@"10c3b9f61bc4"];
    
    [ShareSDK connectWeChatWithAppId:@"wx73d4adffe3bc51da"
                           wechatCls:[WXApi class]];
    [ShareSDK connectMail];
    [ShareSDK connectAirPrint];
    
    
    
    
        [ShareSDK ssoEnabled:NO];
    
//    self.window.rootViewController = [[DefaultTempViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    //TODO: 第六步：开始使用 ShareSDK 进行分享，详见 wiki 上关于构造分享的例子。
    
    
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
