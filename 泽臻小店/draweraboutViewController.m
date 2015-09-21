//
//  draweraboutViewController.m
//  泽臻小店
//
//  Created by xiaoguang yang on 15/5/6.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import "draweraboutViewController.h"

@interface draweraboutViewController ()

@end

@implementation draweraboutViewController
@synthesize drawerview;
@synthesize tableview;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    appdelegate=(AppDelegate*)[[UIApplication sharedApplication ]delegate];
    tableview.delegate=self;
    tableview.dataSource=self;
    [tableview setBackgroundColor:[UIColor clearColor]];
    
    nib=[UINib nibWithNibName:@"settingcell" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:@"settingcell" ];
    tableview.backgroundColor =[UIColor clearColor];
    // Do any additional setup after loading the view.
}


#pragma tableview
-(void)tableView:(UITableView*)tableView  willDisplayCell:(UITableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lbl = [[UILabel alloc] init];
    
    
    lbl.textColor = [UIColor whiteColor];
    
    
    
    [lbl setBackgroundColor:[[UIColor alloc] initWithRed:0.52 green:.43 blue:.4 alpha:.21]];
    
    switch (section) {
        case 0:
            lbl.text = @"个人信息";
            break;
            
        case 1:
            lbl.text = @"通用";
            break;
            
    }
    
    return lbl;
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 4;
            
        case 1:
            return 5;
        default:
            return 0;
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}



-(void)switchmode:(id)object
{
    NSUserDefaults *userinfo = [NSUserDefaults standardUserDefaults];
    UISwitch * modeswitch = (UISwitch*)object;
    
    [userinfo setBool:modeswitch.on forKey:@"uimode" ];
    
    if (modeswitch.on)
        appdelegate.Mode =NO_TabBAR;
    else
        appdelegate.Mode =TabBAR;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *ui  = [[UIView alloc] init];
    return ui;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    settingcell *cell = [tableview dequeueReusableCellWithIdentifier:@"settingcell" ];
    if (cell == nil)
        cell = [[settingcell alloc] init];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [[UIColor alloc] initWithRed:0.52 green:.43 blue:.4 alpha:.21] ;
    if (indexPath.section==0)
    {
        switch (indexPath.row) {
            case 0:
                if (drawerview.islogin)
                    [cell setCellInfo:@"ico_login" title:@"已登录"];
                else
                    [cell setCellInfo:@"ico_login" title:@"未登录"];
                break;
            case 1:
                //                if (rootview.isDayCome)
                //                    [cell setCellInfo:@"shop" title:@"已签到"];
                //                else
                //                    [cell setCellInfo:@"shop" title:@"今天还没有签到,快来签到吧"];
                [cell setCellInfo:@"ico_day.png" title:@"每日签到"];
                
                
                break;
            case 2:
                [cell setCellInfo:@"ico_huodong.png" title:@"活动中心"];
                break;
            case 3:
                [cell setCellInfo:@"ico_saleplan.png" title:@"销售员计划"];
                break;
        }
        
    }
    if (indexPath.section==1)
    {
        switch (indexPath.row) {
            case 0:
                [cell setCellInfo:@"ico_navbar.png" title:@"无导航栏模式"];
                [cell setcellModel1:self x:50];
                break;
            case 1:
                [cell setCellInfo:@"ico_share.png" title:@"分享本店"];
                break;
            case 2:
                [cell setCellInfo:@"ico_phone.png" title:@"联系我们"];
                break;
            case 3:
                [cell setCellInfo:@"ico_dianzan.png" title:@"给APP点赞"];
                break;
            case 4:
                [cell setCellInfo:@"ico_about.png" title:@"关于本店"];
                break;
        }
        
    }
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIActionSheet *alertvie;
    FirstViewController *view;
    NSURL *url;
    
    
    if (indexPath.section ==0)
    {
        switch (indexPath.row) {
            case 0:
                
                
                if (drawerview.islogin == NO)
                {
                    
                    [drawerview closeDrawer];
                    view =drawerview.MainViewController;
                    url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/buyer/auth/login"];
                    //
                    // Do any additional setup after loading the view, typically from a nib.
                    [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
                    
                }
                break;
            case 1:
                //               http://wap.koudaitong.com/v2/apps/checkin?alias=2sxytli7
                [drawerview closeDrawer];
                view =drawerview.MainViewController;
                url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/apps/checkin?alias=2sxytli7"];
                //
                // Do any additional setup after loading the view, typically from a nib.
                [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
                
                break;
            case 2://活动
                [drawerview closeDrawer];
                alertvie = [[UIActionSheet alloc] initWithTitle:@"精彩活动" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"刮刮乐",@"幸运大抽奖",@"生肖翻翻看", @"疯狂猜猜猜", nil];
                
                
                [alertvie showInView:[self view]];
                
                
                break;
            case 3://销售员
                [drawerview closeDrawer];
                view =drawerview.MainViewController;
                url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/trade/directseller/tutorial.html?kdt_id=978484"];
                //
                // Do any additional setup after loading the view, typically from a nib.
                [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
                
                break;
        }
    }
    
    
    
    NSString  * nsStringToOpen;
    SheetUI *sheetui;
    UIStoryboard *story;
    SecondViewController *aboutview;
    
    if (indexPath.section==1)
    {
        switch (indexPath.row) {
            case 0:
                
                break;
            case 1:
                sheetui = [[SheetUI alloc] initclass:self];
                [drawerview closeDrawer];
                uv= [sheetui SHowSheetQuery1:0];
                [self presentModalViewController:uv animated:YES];
                
                
                
                break;
            case 2:
                //                nsStringToOpen = @"weixin://profile/gh_43d4e4599945";
                //
                //
                //                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nsStringToOpen]];
                
                [drawerview closeDrawer];
                [appdelegate.qqapi sendQQWPA];
                
                
                
                
                break;
            case 3:
                [drawerview closeDrawer];
                nsStringToOpen = [NSString  stringWithFormat: @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8",@"974907647"];
                
                
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nsStringToOpen]];
                //        [[UIApplication sharedApplication] openURL:
                //         [NSURL URLWithString:@"http://wpa.qq.com/msgrd?v=3&uin=931133932&site=qq&menu=yes"]];
                break;
            case 4:
                [drawerview closeDrawer];
                story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                //
                aboutview = [story instantiateViewControllerWithIdentifier:@"about"];
                [self presentViewController:aboutview animated:YES completion:nil];
                break;
        }
        
    }
}

-(void)setupshow
{
    return;
}
-(void)cancelquery
{
    return;
    
}

-(void)SetqueryParams:(int)type
{
    
    [uv dismissViewControllerAnimated:YES completion:Nil];
    
    
    NSString *strurl=@"https://itunes.apple.com/cn/app/ze-zhen-xiao-dian-zhuan-wei/id974907647?mt=8";
    UIImage *img =[UIImage imageNamed:@"40.png"];
    
    
    
    switch (type) {
        case 1:
            [appdelegate.wechat sendLinkContent:@"推荐一个专业正品日韩海购应用APP,下载有好礼--泽臻小店" Desc:@"泽臻小店" URL:strurl Image:img WXScene:WXSceneSession];
            
            break;
            
        case 2:
            [appdelegate.wechat sendLinkContent:@"推荐一个专业正品日韩海购应用APP,下载有好礼--泽臻小店" Desc:@"泽臻小店" URL:strurl Image:img WXScene:WXSceneTimeline];
            
            
            break;
        case 3:
            [appdelegate.wechat sendLinkContent:@"推荐一个专业正品日韩海购应用APP,下载有好礼--泽臻小店" Desc:@"泽臻小店" URL:strurl Image:img WXScene:WXSceneFavorite];
            
            break;
        case 4:
            
            [appdelegate.qqapi sendNewMsg:strurl pngname:UIImagePNGRepresentation([UIImage imageNamed:@"120"]) title:@"泽臻小店-日韩正品" desc:@"推荐一个专业正品日韩海购应用APP,下载有好礼--泽臻小店"];
            break;
            
        case 5:
            
            msg=[WBMessageObject message];
            
            
            msg.text = @"这个我觉得还不错，向大家推荐:泽臻小店";
            
            WBWebpageObject *webpage = [WBWebpageObject object];
            webpage.objectID = @"identifier1";
            webpage.title =@"泽臻小店";
            webpage.description = @"泽臻小店";
            webpage.thumbnailData =UIImagePNGRepresentation(img);
            webpage.webpageUrl = strurl;
            msg.mediaObject = webpage;
            
            [appdelegate.wb sendweibo:msg];
            
            break;
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    FirstViewController *view =drawerview.MainViewController;
    NSURL *url;
    switch (buttonIndex) {
        case 0:
            self.tabBarController.selectedIndex=0;
            url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/apps/cards?alias=stv1yd2e"];
            //
            // Do any additional setup after loading the view, typically from a nib.
            [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
            
            break;
        case 1:
            self.tabBarController.selectedIndex=0;
            url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/apps/wheel?alias=mjt3muqy"];
            //
            // Do any additional setup after loading the view, typically from a nib.
            [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
            break;
        case 2:
            self.tabBarController.selectedIndex=0;
            url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/apps/zodiac?alias=5d49voss"];
            //
            // Do any additional setup after loading the view, typically from a nib.
            [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
            break;
        case 3:
            self.tabBarController.selectedIndex=0;
            url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/apps/crazyguess?alias=gk6vthur"];
            //
            // Do any additional setup after loading the view, typically from a nib.
            [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
            break;
            
            
    }
    [actionSheet dismissWithClickedButtonIndex:buttonIndex animated:YES];
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
