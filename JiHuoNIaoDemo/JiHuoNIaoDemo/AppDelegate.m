//
//  AppDelegate.m
//  JiHuoNIaoDemo
//
//  Created by ooo on 2024/9/17.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "GDIndexGuangGao.h"
#import "JHNBaseNavigationeController.h"
#import <JIHuoNiaoAdSDK/JIHuoNiaoAdSDK.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [JiHuoNiaoSDKManager startWithAppid:@"jhnc41hvciv0n6xsbp" AppKey:@"zbdzpf13guuittm70nl3s44gs2fnjcoz" isGetLocation:NO];
    
    UIWindow *keyWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    

    self.window = keyWindow;
    ViewController * vc = [[ViewController alloc]init];
    JHNBaseNavigationeController * nav = [[JHNBaseNavigationeController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;

    [keyWindow makeKeyAndVisible];
    [GDIndexGuangGao showView];
    return YES;
}



@end
