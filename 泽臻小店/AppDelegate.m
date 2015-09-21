//
//  AppDelegate.m
//  泽臻小店
//
//  Created by xiaoguang yang on 15-2-27.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import "AppDelegate.h"
#import "ZWIntroductionViewController.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface AppDelegate ()
@property (nonatomic, strong) ZWIntroductionViewController *introductionView;
@end

@implementation AppDelegate
@synthesize Mode;
@synthesize drawerview;
-(void)setDisplayMode:(UImode)mode
{
    Mode = mode;
    
}

-(void)addLocalNotification
{
    UILocalNotification *notification=[[UILocalNotification alloc]init];
    //设置调用时间
    notification.fireDate=[NSDate dateWithTimeIntervalSinceNow:172800];//通知触发的时间，10s以后
    notification.repeatInterval=2;//通知重复次数
    
    //设置通知属性
    notification.alertBody=@"好久没有光顾了，进来看看新品吧"; //通知主体
//    notification.applicationIconBadgeNumber=1;//应用程序图标右上角显示的消息数
    notification.alertAction=@"打开应用"; //待机界面的滑动动作提示
    notification.alertLaunchImage=@"logo_6.png";//通过点击通知打开应用时的启动图片,这里使用程序启动图片
    notification.soundName=UILocalNotificationDefaultSoundName;//收到通知时播放的声音，默认消息声音
//    //设置用户信息
//    notification.userInfo=@{@"id":@1,@"user":@"Kenshin Cui"};//绑定到通知上的其他附加信息
    
    //调用通知
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}

-(void)addLocalNotification:(NSString *)info
{
    UILocalNotification *notification=[[UILocalNotification alloc]init];
    //设置调用时间
    notification.fireDate=[NSDate dateWithTimeIntervalSinceNow:1];//通知触发的时间，10s以后
    notification.repeatInterval=2;//通知重复次数
    
    //设置通知属性
    notification.alertBody=@"打开看一下吧"; //通知主体
    //    notification.applicationIconBadgeNumber=1;//应用程序图标右上角显示的消息数
    notification.alertAction=@"打开应用"; //待机界面的滑动动作提示
    notification.alertLaunchImage=@"logo_6.png";//通过点击通知打开应用时的启动图片,这里使用程序启动图片
    notification.soundName=UILocalNotificationDefaultSoundName;//收到通知时播放的声音，默认消息声音
    //    //设置用户信息
    //    notification.userInfo=@{@"id":@1,@"user":@"Kenshin Cui"};//绑定到通知上的其他附加信息
  
    //调用通知
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    Mode =[user boolForKey:@"uimode"];
    
    
    [WXApi registerApp:@"wx247f9866eb272d1d"];
    
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kAppKey];
    
    _qqapi  = [[TencentClass alloc] init];
    
    _wechat = [[WeChatClass alloc] init];
    _wb= [[weiboclass alloc] init];
    NSLog(@"model:%@ \n name:%@",[Common DeviceName].dmodel,[Common DeviceName].dname);
    
    NSLog(@"iPhone5 : %d",iPhone5);
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings
                                    settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
                                                                             categories:nil]];
        
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        //这里还是原来的代码
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
    
    
    if ([[UIApplication sharedApplication]currentUserNotificationSettings].types!=UIUserNotificationTypeNone)
    {
         [[UIApplication sharedApplication] cancelAllLocalNotifications];
        [self addLocalNotification];
    }else{
        [[UIApplication sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound  categories:nil]];
    }

    return YES;
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *pushToken = [[[[deviceToken description]
      stringByReplacingOccurrencesOfString:@"<" withString:@""]
          stringByReplacingOccurrencesOfString:@">" withString:@""]
stringByReplacingOccurrencesOfString:@" " withString:@""];

    dispatch_queue_t globalQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 
    dispatch_async(globalQ, ^{
        AppleToken * appletoken =[[AppleToken alloc] init];
        
        AppleDeviceInfoStruct ad;
        ad.apple_Model = [[UIDevice currentDevice].model UTF8String];
        ad.apple_syatem_name = [[UIDevice currentDevice].systemName UTF8String];
        ad.apple_system_ver = [[UIDevice currentDevice].systemVersion UTF8String];
        ad.Apple_Token = [pushToken UTF8String];
        ad.apple_uuid = [[UIDevice currentDevice].identifierForVendor.UUIDString UTF8String];
        
        BOOL xml;
        BOOL iswhile =true;
        int ticks=0;
        while (iswhile) {
            if (ticks>2)
                return ;
            xml=  [appletoken submitAppleDeviceInfo:&ad];
            if (xml)
                return ;
            else
            {
                ticks++;
                sleep(5);
            }
        }
    });
    NSLog(@"regisger success:%@",deviceToken);
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    // 处理推送消息
    NSLog(@"userinfo:%@",userInfo);
    
    NSLog(@"收到推送消息:%@",[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]);
        NSLog(@"收到推送消息:%@",[userInfo objectForKey:@"test"] );
    [self addLocalNotification:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]];
    
}
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Registfail%@",error);
}

-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    if (notificationSettings.types!=UIUserNotificationTypeNone) {
        [self addLocalNotification];
    }
}
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    notification.applicationIconBadgeNumber=1;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    [WeiboSDK handleOpenURL:url delegate:_wb];
    [TencentOAuth HandleOpenURL:url];

    return  [WXApi handleOpenURL:url delegate:_wechat];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [WeiboSDK handleOpenURL:url delegate:_wb ];
    BOOL isSuc = [WXApi handleOpenURL:url delegate:_wechat];
    NSLog(@"url %@ isSuc %d",url,isSuc == YES ? 1 : 0);
    [TencentOAuth HandleOpenURL:url];
    
    
    return  isSuc;
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
     [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];//进入前台取消应用消息图标
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    sleep(1);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
