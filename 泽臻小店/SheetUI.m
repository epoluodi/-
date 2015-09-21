//
//  SheetUI.m
//  VMTSAPP
//
//  Created by appie on 15-1-19.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "SheetUI.h"
#import "Common.h"
@implementation SheetUI



-(id)initclass:(NSObject<queryparams> *)mainview
{
    queryview = mainview;
    
    return [super init];
    
}

//不支持
-(UIActionSheet *)SHowSheetQuery_IOS7
{
    
    UIActionSheet *alert2 = [[UIActionSheet alloc] initWithTitle:@"分享信息" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"", nil];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    width = width /2 /2;
    
    
    UIButton *btn_sender =[[UIButton alloc] init];
    UIButton *btn_link =[[UIButton alloc] init];
    UIButton *btn_Fav =[[UIButton alloc] init];
    UIButton *btn_weibo =[[UIButton alloc] init];
    UIButton *btn_app =[[UIButton alloc] init];
    
    [btn_sender setBackgroundImage:[UIImage imageNamed:@"icon64_wx_logo.png"] forState:UIControlStateNormal];
    [btn_link setBackgroundImage:[UIImage imageNamed:@"icon_res_download_moments.png"] forState:UIControlStateNormal];
    
    [btn_Fav setBackgroundImage:[UIImage imageNamed:@"icon_res_download_collect.png"] forState:UIControlStateNormal];
    
        [btn_weibo setBackgroundImage:[UIImage imageNamed:@"weibo48.png"] forState:UIControlStateNormal];
    
    
    [btn_app setBackgroundImage:[UIImage imageNamed:@"appwechat.png"] forState:UIControlStateNormal];
    
    
    
    btn_sender.frame = CGRectMake(20, 30, 45, 45);
    [btn_sender setTitle:@"微信好友" forState:UIControlStateNormal];
    
    [btn_sender setTitleEdgeInsets:UIEdgeInsetsMake(60, 0, 0, 0)];
    [btn_sender.titleLabel setFont:[UIFont systemFontOfSize:11]];
    
    [btn_sender setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn_sender addTarget:queryview action:@selector(senderwechat) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    btn_link.frame = CGRectMake(btn_sender.frame.origin.x + 45 + 10, 30, 45, 45);
    [btn_link.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [btn_link setTitle:@"朋友圈" forState:UIControlStateNormal];
    [btn_link setTitleEdgeInsets:UIEdgeInsetsMake(60, 0, 0, 0)];
    [btn_link setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [btn_link addTarget:queryview action:@selector(linkwechat) forControlEvents:UIControlEventTouchUpInside];
    
    
    btn_Fav.frame = CGRectMake(45 + btn_link.frame.origin.x +10, 30, 45, 45);
    [btn_Fav.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [btn_Fav setTitle:@"收藏" forState:UIControlStateNormal];
    [btn_Fav setTitleEdgeInsets:UIEdgeInsetsMake(60, 0, 0, 0)];
    [btn_Fav setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn_Fav addTarget:queryview action:@selector(favwechat) forControlEvents:UIControlEventTouchUpInside];
    
    btn_weibo.frame = CGRectMake(45 + btn_Fav.frame.origin.x +10, 30, 45, 45);
    [btn_weibo.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [btn_weibo setTitle:@"微博" forState:UIControlStateNormal];
    [btn_weibo setTitleEdgeInsets:UIEdgeInsetsMake(60, 0, 0, 0)];
    [btn_weibo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn_weibo addTarget:queryview action:@selector(weibo) forControlEvents:UIControlEventTouchUpInside];
    
    
    btn_app.frame = CGRectMake(45 + btn_weibo.frame.origin.x +10, 30, 45, 45);
    [btn_app.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [btn_app setTitle:@"QQ分享" forState:UIControlStateNormal];
    [btn_app setTitleEdgeInsets:UIEdgeInsetsMake(60, 0, 0, 0)];
    [btn_app setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn_app addTarget:queryview action:@selector(appwechat) forControlEvents:UIControlEventTouchUpInside];
    
    
  
        [alert2 addSubview:btn_sender];
        [alert2 addSubview:btn_link];
        [alert2 addSubview:btn_Fav];
        [alert2 addSubview:btn_weibo];
        [alert2 addSubview:btn_app];
   
    //自定义搜索界面
    return alert2;
}

//
-(UIAlertController*)SHowSheetQuery1:(int)model
{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n" preferredStyle:UIAlertControllerStyleActionSheet];
        alert.title=@"分享信息";
    UIAlertAction *action1;

    
    if (model ==1)
    {
        action1 = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
        
        
        [queryview setupshow];
        NSLog(@"cancle action");
    }];
        
    
    }
    else
    {
        action1 = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancle action") style:UIAlertActionStyleCancel  handler:^(UIAlertAction *action) {
            
            
            [queryview cancelquery];
            NSLog(@"cancle action");
        }];
    }
     [alert addAction:action1];
    
    
    
    CGFloat width = [Common GetScreen].size.width;
    
    width = width /2 /2;
    
    
    UIButton *btn_sender =[[UIButton alloc] init];
    UIButton *btn_link =[[UIButton alloc] init];
    UIButton *btn_Fav =[[UIButton alloc] init];
    UIButton *btn_weibo =[[UIButton alloc] init];
    UIButton *btn_app =[[UIButton alloc] init];
    
    [btn_sender setBackgroundImage:[UIImage imageNamed:@"icon64_wx_logo.png"] forState:UIControlStateNormal];
    [btn_link setBackgroundImage:[UIImage imageNamed:@"icon_res_download_moments.png"] forState:UIControlStateNormal];
    
    [btn_Fav setBackgroundImage:[UIImage imageNamed:@"icon_res_download_collect.png"] forState:UIControlStateNormal];
        [btn_weibo setBackgroundImage:[UIImage imageNamed:@"weibo48.png"] forState:UIControlStateNormal];
    [btn_app setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
    
    
    
    btn_sender.frame = CGRectMake(20, 30, 45, 45);
    [btn_sender setTitle:@"微信好友" forState:UIControlStateNormal];
    
    [btn_sender setTitleEdgeInsets:UIEdgeInsetsMake(60, 0, 0, 0)];
    [btn_sender.titleLabel setFont:[UIFont systemFontOfSize:11]];
    
    [btn_sender setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn_sender addTarget:self action:@selector(senderwechat) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    btn_link.frame = CGRectMake(btn_sender.frame.origin.x + 45 + 10, 30, 45, 45);
    [btn_link.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [btn_link setTitle:@"朋友圈" forState:UIControlStateNormal];
    [btn_link setTitleEdgeInsets:UIEdgeInsetsMake(60, 0, 0, 0)];
    [btn_link setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [btn_link addTarget:self action:@selector(linkwechat) forControlEvents:UIControlEventTouchUpInside];
    
    
    btn_Fav.frame = CGRectMake(45 + btn_link.frame.origin.x +10, 30, 45, 45);
    [btn_Fav.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [btn_Fav setTitle:@"收藏" forState:UIControlStateNormal];
    [btn_Fav setTitleEdgeInsets:UIEdgeInsetsMake(60, 0, 0, 0)];
    [btn_Fav setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn_Fav addTarget:self action:@selector(favwechat) forControlEvents:UIControlEventTouchUpInside];
    
    btn_weibo.frame = CGRectMake(45 + btn_Fav.frame.origin.x +10, 30, 45, 45);
    [btn_weibo.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [btn_weibo setTitle:@"微博" forState:UIControlStateNormal];
    [btn_weibo setTitleEdgeInsets:UIEdgeInsetsMake(60, 0, 0, 0)];
    [btn_weibo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn_weibo addTarget:self action:@selector(weibo)
        forControlEvents:UIControlEventTouchUpInside];
    
    
    btn_app.frame = CGRectMake(45 + btn_weibo.frame.origin.x +10, 30, 45, 45);
    [btn_app.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [btn_app setTitle:@"QQ分享" forState:UIControlStateNormal];
    [btn_app setTitleEdgeInsets:UIEdgeInsetsMake(60, 0, 0, 0)];
    [btn_app setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn_app addTarget:self action:@selector(appwechat) forControlEvents:UIControlEventTouchUpInside];
    
    
  
        [alert.view addSubview:btn_sender];
        [alert.view addSubview:btn_link];
        [alert.view addSubview:btn_Fav];
        [alert.view addSubview:btn_weibo];
        [alert.view addSubview:btn_app];
 
    //自定义搜索界面
    return alert;
    
}

-(void)senderwechat
{
    [queryview SetqueryParams:1];
    
}

-(void)linkwechat
{
    [queryview SetqueryParams:2];
}
-(void)favwechat
{
    [queryview SetqueryParams:3];
}
-(void)weibo
{
    [queryview SetqueryParams:5];
}
-(void)appwechat
{
    [queryview SetqueryParams:4];
}


@end

