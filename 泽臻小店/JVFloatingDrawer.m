//
//  JVFloatingDrawer.m
//  泽臻小店
//
//  Created by xiaoguang yang on 15/5/5.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import "JVFloatingDrawer.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"


@implementation JVFloatingDrawer

@synthesize isDayCome;
@synthesize islogin;

-(instancetype)init
{
    drawersStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    _drawerViewController =self.drawerViewController;
    _drawerAnimator =self.drawerAnimator;
    [self configureDrawerViewController];
    
    isDayCome=NO;
    islogin=NO;
    threadlogin = [[NSThread alloc] initWithTarget:self selector:@selector(checklogin) object:nil];
    [threadlogin start];
    
    return [super init];
    
}


-(void)checklogin
{
    [NSThread sleepForTimeInterval:0.5f];
   
    

    NSURL *url = [NSURL URLWithString:@"http://wap.koudaitong.com/v2/usercenter/15hfcicmo"];
    
 
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];

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

    
}



-(void)showView:(UIViewController *)viewcontrol
{
    [viewcontrol presentViewController:_drawerViewController animated:YES completion:nil];
    
}
- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    if (!_drawerAnimator) {
        _drawerAnimator = [[JVFloatingDrawerSpringAnimator alloc] init];
    }
    
    return _drawerAnimator;
}

- (JVFloatingDrawerViewController *)drawerViewController {
    if (!_drawerViewController) {
        _drawerViewController = [[JVFloatingDrawerViewController alloc] init];
    }
    
    return _drawerViewController;
}


- (draweraboutViewController *)leftDrawerViewController {
    if (!_leftcontactViewController) {
        
        _leftcontactViewController = [drawersStoryboard instantiateViewControllerWithIdentifier:@"drawerabout"];
        _leftcontactViewController.drawerview=self;
    }
    
    return _leftcontactViewController;
}



- (void)configureDrawerViewController {
    self.drawerViewController.leftViewController = self.leftDrawerViewController;

    self.drawerViewController.centerViewController = self.drawerMainViewController;
    
    self.drawerViewController.animator = self.drawerAnimator;
    
    self.drawerViewController.backgroundImage = [UIImage imageNamed:@"aboutback.png"];
}

- (FirstViewController *)drawerMainViewController {
    if (!_MainViewController) {
        _MainViewController = [drawersStoryboard instantiateViewControllerWithIdentifier:@"webview"];
        _MainViewController.drawerview=self;
    }
    
    return _MainViewController;
}

- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated {
    [self.drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideLeft animated:animated completion:nil];
}
-(void)closeDrawer
{
    [self.drawerViewController closeDrawerWithSide:JVFloatingDrawerSideLeft animated:YES completion:nil];
}

@end
