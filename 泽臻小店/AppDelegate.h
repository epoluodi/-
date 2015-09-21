//
//  AppDelegate.h
//  泽臻小店
//
//  Created by xiaoguang yang on 15-2-27.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeChatClass.h"
#import "WXApi.h"
#import "Common.h"
#import "WeChatClass.h"
#import "weiboclass.h"
#import "TencentClass.h"
#import "JVFloatingDrawer.h"
#import "AppleToken.h"

//com.sina.weibo.SNWeiboSDKDemo
@class JVFloatingDrawer;
typedef NS_ENUM(NSUInteger, UImode)
{
    TabBAR=0,
    NO_TabBAR ,
    
    
};

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong,nonatomic) JVFloatingDrawer *drawerview;
@property (strong, nonatomic) UIWindow * window;
@property (strong,nonatomic)WeChatClass *wechat;
@property (strong,nonatomic)weiboclass *wb;
@property   (strong,nonatomic)TencentClass *qqapi;
@property UImode Mode;


-(void)setDisplayMode:(UImode)mode;

@end

