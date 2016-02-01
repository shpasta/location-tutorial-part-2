//
//  AppDelegate.m
//  TrackLocation
//
//  Created by Stanislav Shpak on 12/25/15.
//  Copyright © 2015 Stanislav Shpak. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "EventLogger.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navigationController;
    
    if ([launchOptions objectForKey:UIApplicationLaunchOptionsLocationKey]) {
        [[EventLogger sharedInstance] saveEvent:@"App did launch with location key"];
    } else {
        [[EventLogger sharedInstance] saveEvent:@"App did launch"];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[EventLogger sharedInstance] saveEvent:@"App did enter background"];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[EventLogger sharedInstance] saveEvent:@"App did enter foreground"];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
