//
//  FirstViewController.h
//  泽臻小店
//
//  Created by xiaoguang yang on 15-2-27.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingView.h"
#import "YYAnimationIndicator.h"
#import "AppDelegate.h"
#import "SheetUI.h"
#import "JVFloatingDrawer.h"

@class AppDelegate;
@class JVFloatingDrawer;

@interface FirstViewController  : UIViewController<UIWebViewDelegate,queryparams>
{
    WBMessageObject *msg;
    NSString *webtitle;
    UINavigationItem *navtitle;
    YYAnimationIndicator *indicator;
    UIVisualEffectView *effectview;
    UIBarButtonItem *leftButton;
    UIBarButtonItem *rightButton;
    AppDelegate *appdelegate;
    UIAlertController *uv;
    UIActionSheet *uv2;
   
}


@property (strong,nonatomic) JVFloatingDrawer* drawerview;
@property (weak, nonatomic) IBOutlet UIWebView *webui;
@property (weak, nonatomic) IBOutlet UINavigationBar *uititle;



@end

