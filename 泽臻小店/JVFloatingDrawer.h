//
//  JVFloatingDrawer.h
//  泽臻小店
//
//  Created by xiaoguang yang on 15/5/5.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "draweraboutViewController.h"
#import "FirstViewController.h"

@class JVFloatingDrawerViewController;
@class JVFloatingDrawerSpringAnimator;
@class FirstViewController;
@class draweraboutViewController;

@interface JVFloatingDrawer : NSObject
{
     UIStoryboard *drawersStoryboard;
    NSThread *threadlogin;
}

@property BOOL islogin;
@property BOOL isDayCome;


@property (nonatomic, strong) JVFloatingDrawerViewController *drawerViewController;
@property (nonatomic, strong) JVFloatingDrawerSpringAnimator *drawerAnimator;

@property (nonatomic, strong) draweraboutViewController *leftcontactViewController;

@property (nonatomic, strong) FirstViewController *MainViewController;

- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated;
-(void)showView:(UIViewController *)viewcontrol;
-(void)closeDrawer;

@end
