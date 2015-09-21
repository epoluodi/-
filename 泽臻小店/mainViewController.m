//
//  mainViewController.m
//  泽臻小店
//
//  Created by xiaoguang yang on 15-3-19.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import "mainViewController.h"
#import "goodsview.h"

@interface mainViewController ()

@end

@implementation mainViewController
@synthesize islogin;
@synthesize isDayCome;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    UITabBarItem *tab1 =     [self.tabBar.items objectAtIndex:0];
    tab1.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    tab1.tag=0;
    UITabBarItem *tab2 =     [self.tabBar.items objectAtIndex:1];
    tab2.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    tab2.tag=1;
    UITabBarItem *tab3 =     [self.tabBar.items objectAtIndex:2];
    tab3.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    tab3.tag=2;
    isDayCome=NO;
    islogin=NO;
    threadlogin = [[NSThread alloc] initWithTarget:self selector:@selector(checklogin) object:nil];
    [threadlogin start];
    
    
}

-(void)checklogin
{
    [NSThread sleepForTimeInterval:0.5f];
    NSLog(@"开始判断登陆","开始");
    
   
    
    /*
     NSString *urlString =url;
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
     [request setURL:[NSURL URLWithString:urlString]];
     [request setHTTPMethod:@"GET"];
     NSHTTPURLResponse* urlResponse = nil;
     NSError *error = [[NSError alloc] init];
     NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
     NSMutableString *result = [[NSMutableString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
     NSLog(@"The result string is :%@",result);
     */
    //第一步，创建URL
    NSURL *url = [NSURL URLWithString:@"http://wap.koudaitong.com/v2/usercenter/15hfcicmo"];
    
    //第二步，通过URL创建网络请求
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //NSURLRequest初始化方法第一个参数：请求访问路径，第二个参数：缓存协议，第三个参数：网络请求超时时间（秒）
    /*
     其中缓存协议是个枚举类型包含：
     NSURLRequestUseProtocolCachePolicy（基础策略）
     NSURLRequestReloadIgnoringLocalCacheData（忽略本地缓存）
     NSURLRequestReturnCacheDataElseLoad（首先使用缓存，如果没有本地缓存，才从原地址下载）
     NSURLRequestReturnCacheDataDontLoad（使用本地缓存，从不下载，如果本地没有缓存，则请求失败，此策略多用于离线操作）
     NSURLRequestReloadIgnoringLocalAndRemoteCacheData（无视任何缓存策略，无论是本地的还是远程的，总是从原地址重新下载）
     NSURLRequestReloadRevalidatingCacheData（如果本地缓存是有效的则不下载，其他任何情况都从原地址重新下载）
     */
    //第三步，连接服务器
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
   
    
    if ([str containsString:@"<title>登录</title>"])
    {
        islogin=false;
        
    }
    else
    {
        islogin=true;
    }
//     NSLog(@"没有登录 %d",islogin);
//    url = [NSURL URLWithString:@"http://wap.koudaitong.com/v2/apps/checkin?alias=2sxytli7"];
//    request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
//    [NSThread sleepForTimeInterval:1];
//    received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    str = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",str);
//    if ([str containsString:@"已签到"])
//        isDayCome =YES;
//    else
//        isDayCome =NO;
    
}


-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    goodsview *gv;
    contactview *ctview;
    switch (self.selectedIndex) {
        case 1:
            gv = (goodsview *)self.selectedViewController;
            gv.searchtext.text =@"";
           
            break;
        case 2:
            ctview=(contactview *)self.selectedViewController;
            [ctview.tableview reloadData];
            break;
    }
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
