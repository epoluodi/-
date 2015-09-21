//
//  SecondViewController.m
//  泽臻小店
//
//  Created by xiaoguang yang on 15-2-27.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize navbar;

- (void)viewDidLoad {
    [super viewDidLoad];
    leftButton = [[UIBarButtonItem alloc]
                  initWithTitle:@"返回"                                   style:UIBarButtonItemStyleBordered                                   target:self                                   action:@selector(selectLeftAction:)];
    navtitle = [[UINavigationItem alloc] init];
    
    [navtitle setLeftBarButtonItem:leftButton];
    navtitle.title = @"关于我们";
     [navbar pushNavigationItem:navtitle animated:YES];
    
    // Do any additional setup after loading the view, typically from a nib.
    
//    btn_awardcenter = [[UIButton alloc] initWithFrame:[self GetSize1]];
// 
//    [btn_awardcenter setBackgroundImage:[UIImage imageNamed:@"awardcenter1.png"] forState:UIControlStateHighlighted];
//    [btn_awardcenter setBackgroundImage:[UIImage imageNamed:@"awardcenter2.png"] forState:UIControlStateNormal];
//    
//    [btn_awardcenter addTarget:self action:@selector(awardcenter:) forControlEvents:UIControlEventTouchUpInside];
//   
//    
//    btn_sales = [[UIButton alloc] initWithFrame:[self GetSize2]];
//    
//    [btn_sales setBackgroundImage:[UIImage imageNamed:@"saleplan1.png"] forState:UIControlStateHighlighted];
//    [btn_sales setBackgroundImage:[UIImage imageNamed:@"saleplan2.png"] forState:UIControlStateNormal];
//    
//    [btn_sales addTarget:self action:@selector(sales:) forControlEvents:UIControlEventTouchUpInside];
//    
//    btn_appEvaluation = [[UIButton alloc] initWithFrame:[self GetSize3]];
//    
//    [btn_appEvaluation setBackgroundImage:[UIImage imageNamed:@"appeva2.png"] forState:UIControlStateHighlighted];
//    [btn_appEvaluation setBackgroundImage:[UIImage imageNamed:@"appeva1.png"] forState:UIControlStateNormal];
//    
//    [btn_appEvaluation addTarget:self action:@selector(appEvaluation:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:btn_awardcenter];
//    [self.view addSubview:btn_sales];
//    [self.view addSubview:btn_appEvaluation];
    
}
-(void)selectLeftAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//
//-(CGRect)GetSize1
//{
//    CGRect rect ;
//    if (iPhone4)
//    {
//        rect = CGRectMake(50, 38, 134, 39);
//        return rect;
//    }
//    if (iPhone5)
//    {
//        rect = CGRectMake(47, 35, 134, 39);
//        return rect;
//    }
//    if (iPhone6)
//    {
//        rect = CGRectMake(66, 53, 134, 39);
//        return rect;
//    }
//    if (iPhone6plus)
//    {
//        rect = CGRectMake(73, 61, 134, 39);
//        return rect;
//    }
//    return CGRectZero;
//}
//
//-(CGRect)GetSize2
//{
//    CGRect rect ;
//    if (iPhone4)
//    {
//        rect = CGRectMake(129, 89, 134, 39);
//        return rect;
//    }
//    if (iPhone5)
//    {
//        rect = CGRectMake(135, 109, 134, 39);
//        return rect;
//    }
//    
//    if (iPhone6)
//    {
//        rect = CGRectMake(172, 133, 134, 39);
//        return rect;
//    }
//    if (iPhone6plus)
//    {
//        rect = CGRectMake(213, 148, 134, 39);
//        return rect;
//    }
//    return CGRectZero;
//}
//-(CGRect)GetSize3
//{
//    CGRect rect ;
//    if (iPhone4)
//    {
//        rect = CGRectMake(50, 153, 134, 39);
//        return rect;
//    }
//    if (iPhone5)
//    {
//        rect = CGRectMake(53, 176, 134, 39);
//        return rect;
//    }
//    
//    if (iPhone6)
//    {
//        rect = CGRectMake(50, 215, 134, 39);
//        return rect;
//    }
//    
//    if (iPhone6plus)
//    {
//        rect = CGRectMake(72, 241, 134, 39);
//        return rect;
//    }
//    
//    
//    return CGRectZero;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//-(void)awardcenter:(id)sender
//{
//    UIActionSheet *alertvie = [[UIActionSheet alloc] initWithTitle:@"精彩活动" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"刮刮乐",@"幸运大抽奖",@"生肖翻翻看", @"疯狂猜猜猜", nil];
//                               
//    
//    [alertvie showInView:[self view]];
//    
//}
//
//-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    
//    FirstViewController *view =[self.tabBarController.viewControllers objectAtIndex:0];
//    NSURL *url;
//    switch (buttonIndex) {
//        case 0:
//            self.tabBarController.selectedIndex=0;
//            url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/apps/cards?alias=stv1yd2e"];
//            //
//            // Do any additional setup after loading the view, typically from a nib.
//            [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
//            
//            break;
//        case 1:
//            self.tabBarController.selectedIndex=0;
//            url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/apps/wheel?alias=mjt3muqy"];
//            //
//            // Do any additional setup after loading the view, typically from a nib.
//            [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
//            break;
//        case 2:
//            self.tabBarController.selectedIndex=0;
//            url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/apps/zodiac?alias=5d49voss"];
//            //
//            // Do any additional setup after loading the view, typically from a nib.
//            [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
//            break;
//        case 3:
//            self.tabBarController.selectedIndex=0;
//            url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/apps/crazyguess?alias=gk6vthur"];
//            //
//            // Do any additional setup after loading the view, typically from a nib.
//            [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
//            break;
//        case 4:
//            
//            break;
//     
//    }
//    [actionSheet dismissWithClickedButtonIndex:buttonIndex animated:YES];
//}
//
//-(void)appEvaluation:(id)sender
//{
//    NSString  * nsStringToOpen = [NSString  stringWithFormat: @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8",@"974907647"];
//
//    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nsStringToOpen]];
////        [[UIApplication sharedApplication] openURL:
////         [NSURL URLWithString:@"http://wpa.qq.com/msgrd?v=3&uin=931133932&site=qq&menu=yes"]];
//}
//
//-(void)sales:(id)sender
//{
//    self.tabBarController.selectedIndex=0;
//    FirstViewController *view =[self.tabBarController.viewControllers objectAtIndex:0];
//    NSURL *url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/trade/directseller/tutorial.html?kdt_id=978484"];
//    //
//    // Do any additional setup after loading the view, typically from a nib.
//    [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
//
//}
@end
