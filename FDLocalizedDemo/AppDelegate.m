//
//  AppDelegate.m
//  FDLocalizedDemo
//
//  Created by 徐忠林 on 14/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#warning 通过单利来设置不同的语言转换
- (void)reDrawAllUIForLanguage:(NSString *)language {
    [[FDLanguageUtil sharedInstance] setLanguage:language];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    UINavigationController *nav =[[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    
    #warning 通过单利来设置不同的语言转换
    //获取手机系统语言
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    NSLog(@"当前使用的语言：%@",currentLanguage);
    [FDLanguageUtil sharedInstance].currentLanguage = currentLanguage;
    
    
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


//-(NSString *)showText:(NSString *)key
//{
//    
//    NSString *path = [[NSBundle mainBundle] pathForResource:_lan ofType:@"lproj"];
//    
//    
//    return [[NSBundle bundleWithPath:path] localizedStringForKey:key value:nil table:@"ASLocalized"];
//}


@end
