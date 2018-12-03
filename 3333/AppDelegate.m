//
//  AppDelegate.m
//  3333
//
//  Created by 张晓亮 on 2018/12/1.
//  Copyright © 2018 张晓亮. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()
@property(nonatomic,strong)UIWindow *kk;
@property(nonatomic,copy)void(^test1)(void);
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.



    [self testConcreteGlobalBlock];
    [self testConcreteStackBlock];
    [self testConcreteMallocBlock];

    UIWindow *kk = [UIWindow new];
    kk.windowLevel = UIWindowLevelStatusBar - 1;

    kk.rootViewController = [UIViewController new];
    kk.rootViewController.view.frame = CGRectMake(0, 20, 100, 100);
    kk.rootViewController.view.backgroundColor = [UIColor redColor];
    self.kk = kk;

    self.kk.hidden = NO;
    return YES;
}


/**
 ConcreteGlobalBlock 创建
 */
-(void)testConcreteGlobalBlock {


    self.test1 = ^{

        NSLog(@"2222");
    };


    NSLog(@"block： self.test1 class is %@",[self.test1 class]);

}

/**
 ConcreteStackBlock 创建
 */
-(void)testConcreteStackBlock {

    __weak typeof(self)weakself = self;
    void (^pp)(void) = ^{

        NSLog(@"1111");
        NSLog(@"%@",weakself);
    };

    NSLog(@"block： pp class is %@",[pp class]);
    pp();
}

/**
 ConcreteMallocBlock 创建
 */
-(void)testConcreteMallocBlock  {

    //也可自己看看__block是怎么回事
    __block int kk = 0;
    void(^ll)(void) = [^{

        kk = 1;
    } copy];

    NSLog(@"block： ll class is %@",[ll class]);

    ll();


}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
