//
//  FirstViewController.m
//  泽臻小店
//
//  Created by xiaoguang yang on 15-2-27.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//
//#import <objc/runtime.h>
#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize webui;
@synthesize uititle;
@synthesize drawerview;
- (void)viewDidLoad {
    [super viewDidLoad];
    appdelegate=(AppDelegate*)[[UIApplication sharedApplication ]delegate];
    
    
    
    // http://wap.koudaitong.com/v2/buyer/auth/login.jsonp?phone=13851625332&password=123456
    
    //    http://wap.koudaitong.com/v2/usercenter/15hfcicmo
    NSURL *url = [[NSURL alloc] initWithString:@"http://wap.koudaitong.com/v2/showcase/homepage?kdt_id=978484"];
    //
    // Do any additional setup after loading the view, typically from a nib.
    [webui loadRequest:[[NSURLRequest alloc] initWithURL:url ]];
    webui.delegate =self;
    webui.allowsInlineMediaPlayback=YES;
    webui.mediaPlaybackAllowsAirPlay=YES;
    webtitle = @"正在加载...";
    navtitle = [[UINavigationItem alloc] init];
    navtitle.title = webtitle;
    
    leftButton = [[UIBarButtonItem alloc]
                  initWithTitle:@"返回"                                   style:UIBarButtonItemStyleBordered                                   target:self                                   action:@selector(selectLeftAction:)];
    
    [navtitle setLeftBarButtonItem:leftButton];
    
    rightButton = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStyleBordered target:self action:@selector(selectrightAction:)];
    [navtitle setRightBarButtonItem:rightButton animated:YES];
    
    [uititle pushNavigationItem:navtitle animated:YES];
    
    
    
    
    
    indicator = [[YYAnimationIndicator alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-40, self.view.frame.size.height/2-40, 80, 80)];
    [indicator setLoadText:@"正在努力加载..."];
    
    
    //双击保存图片功能
    //    UITapGestureRecognizer *doubleTapevent = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    //    [doubleTapevent setNumberOfTouchesRequired:2];
    //    //    [doubleTapevent setNumberOfTapsRequired:2];
    //
    //
    //    [webui addGestureRecognizer:doubleTapevent];
    

    
//    UISwipeGestureRecognizer *leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleft)];
//
//    
//    leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
//
//    
//    [webui addGestureRecognizer:leftSwipeGestureRecognizer];
 
//    installHook();
    
    if (appdelegate.Mode == NO_TabBAR)
        [self resetview];
}

//static void installHook()
//{
//
//    
//    Class klass = objc_getClass("UIWebDocumentView");
//    Method targetMethod = class_getInstanceMethod(klass, @selector(touchesMoved:withEvent:));
//    Method newMethod = class_getInstanceMethod(klass, @selector(__touchesMoved:withEvent:));
//    method_exchangeImplementations(targetMethod, newMethod);
//}
//- (void)__touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"1111111");
//    
//}

-(void)handleft
{
    [appdelegate.drawerview toggleLeftDrawer:self animated:YES];
}
-(void)resetview
{

    
    NSLayoutConstraint *heightConstraint;

    
    
    heightConstraint = [NSLayoutConstraint constraintWithItem:webui
            attribute:NSLayoutAttributeBottom
            relatedBy:NSLayoutRelationEqual
            toItem:self.view
            attribute:NSLayoutAttributeBottom
            multiplier:1.0
            constant:0.0];
    [self.view addConstraint:heightConstraint];
  


    
    
}
-(void) doubleTap :(UITapGestureRecognizer*) sender
{
    //  <Find HTML tag which was clicked by user>
    //  <If tag is IMG, then get image URL and start saving>
    //    int scrollPositionY = [[webui stringByEvaluatingJavaScriptFromString:@"window.pageYOffset"] intValue];
    //    int scrollPositionX = [[webui stringByEvaluatingJavaScriptFromString:@"window.pageXOffset"] intValue];
    //
    //    int displayWidth = [[webui stringByEvaluatingJavaScriptFromString:@"window.outerWidth"] intValue];
    //    CGFloat scale = webui.frame.size.width / displayWidth;
    
    CGPoint pt = [sender locationInView:webui];
    //    pt.x *= scale;
    //    pt.y *= scale;
    //    pt.x += scrollPositionX;
    //    pt.y += scrollPositionY;
    
    NSString *js = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).tagName", pt.x, pt.y];
    NSString * tagName = [webui stringByEvaluatingJavaScriptFromString:js];
    if ([tagName isEqualToString:@"IMG"]) {
        NSString *imgURL = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).src", pt.x, pt.y];
        NSString *urlToSave = [webui stringByEvaluatingJavaScriptFromString:imgURL];
        NSLog(@"image url=%@", urlToSave);
        
        [NSThread detachNewThreadSelector:@selector(getImageByUrl:) toTarget:self withObject:urlToSave];
    }
}


-(void)getImageByUrl:(id)object{
    NSString *strurl=(NSString*)object;
    
    
    NSURL *url=[NSURL URLWithString:strurl];
    NSData *imagedata=[NSData dataWithContentsOfURL:url];
    if (imagedata) {
        
        UIImage *image = [UIImage imageWithData:imagedata];
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
        NSLog(@"保存完成");
    }else{
        NSLog(@"保存失败");
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"保存图片结果提示"
                              
                              message:@"失败"
                              
                              delegate:self
                              
                              cancelButtonTitle:@"确定"
                              
                              otherButtonTitles:nil];
        
        [alert show];
    }
    
    [self performSelectorOnMainThread:@selector(setImage:) withObject:nil waitUntilDone:NO];//主线程更新视图
    
}


-(void)setImage:(id)object
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"保存图片结果提示"
                          
                          message:@"图片保存到相册中"
                          
                          delegate:self
                          
                          cancelButtonTitle:@"确定"
                          
                          otherButtonTitles:nil];
    
    [alert show];
    NSLog(@"完成");
}
//
//-(void)senderwechat
//{
//    [self SetqueryParams:1];
//
//}
//
//-(void)linkwechat
//{
//    [self SetqueryParams:2];
//}
//-(void)favwechat
//{
//    [self SetqueryParams:3];
//}
//-(void)weibo
//{
//    [self SetqueryParams:5];
//}
//-(void)appwechat
//{
//    [self SetqueryParams:5];
//}



-(void)selectrightAction:(id)sender
{
    
    SheetUI *sheetui = [[SheetUI alloc] initclass:self];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        if (appdelegate.Mode == NO_TabBAR)
            uv= [sheetui SHowSheetQuery1:1];
        else
            uv= [sheetui SHowSheetQuery1:0];
        [self presentModalViewController:uv animated:YES];
    }
    
    else
    {
        uv2 = [sheetui SHowSheetQuery_IOS7];
        
        [uv2 showInView:self.view];
        
    }
    
    
    
    //    [webui.scrollView setContentOffset:CGPointZero animated:YES];
    //    NSString *strurl = [ webui.request.URL absoluteString];
    //    UIImage *img =[self imageFromView:webui atFrame:CGRectMake(0, 0, webui.frame.size.width, webui.frame.size.height*0.8)];
    //    [appdelegate.wechat sendLinkContent:@"小伙伴们，推荐给大家一个很好的产品" Desc:webtitle URL:strurl Image:img WXScene:WXSceneSession];
}
-(void)setupshow
{
    [self handleft];
}
-(void)SetqueryParams:(int)type
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [uv dismissViewControllerAnimated:YES completion:Nil];
    }
    else {
        [uv2 dismissWithClickedButtonIndex:0 animated:YES];
    }
    [webui.scrollView setContentOffset:CGPointZero animated:YES];
    webtitle =[webui stringByEvaluatingJavaScriptFromString:
               @"document.title"];
    NSString *strurl;
    UIImage *img ;
    NSString *wechattitle;
    
    if ([webtitle isEqual:@"兼职销售员计划"])
    {
        strurl = @"http://wap.koudaitong.com/v2/trade/directseller/tutorial.html?kdt_id=978484";
        img =[UIImage imageNamed:@"sale.png"];
        wechattitle = @"为销售人员量身定制的销售计划，让你也可以轻松赚钱，快来加入吧";
    }
    else
    {
        strurl = [ webui.request.URL absoluteString];
        if ([webtitle isEqual:@"泽臻正品小店"])
        {
            img = [UIImage imageNamed:@"120"];
        }
        else
            img =[self imageFromView:webui atFrame:CGRectMake(0, 0, webui.frame.size.width, webui.frame.size.height*0.8)];
        
        wechattitle=webtitle;
    }
    switch (type) {
        case 1:
            img=[self scaleToSize:img size:CGSizeMake(img.size.width*0.6, img.size.height*0.6)];
            [appdelegate.wechat sendLinkContent:wechattitle Desc:webtitle URL:strurl Image:img WXScene:WXSceneSession];
            break;
            
        case 2:
            img=[self scaleToSize:img size:CGSizeMake(img.size.width*0.6, img.size.height*0.6)];
            [appdelegate.wechat sendLinkContent:wechattitle Desc:webtitle URL:strurl Image:img WXScene:WXSceneTimeline];
            break;
        case 3:
            img=[self scaleToSize:img size:CGSizeMake(img.size.width*0.6, img.size.height*0.6)];
            [appdelegate.wechat sendLinkContent:wechattitle Desc:webtitle URL:strurl Image:img WXScene:WXSceneFavorite];
            break;
        case 4:
            
            [appdelegate.qqapi sendNewMsg:strurl pngname:UIImagePNGRepresentation(img) title:wechattitle desc:webtitle];
            break;
        case 5:
            
            msg=[WBMessageObject message];
            //            WBImageObject *image = [WBImageObject object];
            
            msg.text =[[NSString alloc] initWithFormat: @"这个我觉得还不错，向大家推荐：%@",webtitle];
            //            image.imageData = UIImagePNGRepresentation(img);
            //
            //
            //            msg.imageObject = image;
            //
            //
            //
            WBWebpageObject *webpage = [WBWebpageObject object];
            webpage.objectID = @"identifier1";
            webpage.title =@"泽臻小店";
            webpage.description = webtitle;
            webpage.thumbnailData =UIImagePNGRepresentation([self scaleToSize:img size:CGSizeMake(50, 50)]);
            webpage.webpageUrl = strurl;
            msg.mediaObject = webpage;
            
            [appdelegate.wb sendweibo:msg];
            
            break;
    }
}
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}


-(void)cancelquery
{
    return;
    
}


-(void)selectLeftAction:(id)sender
{
    
    if ([[navtitle leftBarButtonItem].title  isEqual: @"刷新"])
    {
        [webui reload];
        return;
    }
    [webui goBack];
}

-(void)setVisualEffect
{
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    
    effectview.frame =webui.frame;
    
    [self.view addSubview:effectview];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //    static NSString* const kTouchJavaScriptString=
    //    @"document.ontouchstart=function(event){\
    //    x=event.targetTouches[0].clientX;\
    //    y=event.targetTouches[0].clientY;\
    //    document.location=\"myweb:touch:start:\"+x+\":\"+y;};\
    //    document.ontouchmove=function(event){\
    //    x=event.targetTouches[0].clientX;\
    //    y=event.targetTouches[0].clientY;\
    //    document.location=\"myweb:touch:move:\"+x+\":\"+y;};\
    //    document.ontouchcancel=function(event){\
    //    document.location=\"myweb:touch:cancel\";};\
    //    document.ontouchend=function(event){\
    //    document.location=\"myweb:touch:end\";};";
    //
    //    [webui stringByEvaluatingJavaScriptFromString:kTouchJavaScriptString];
    
    
    webtitle =[webui stringByEvaluatingJavaScriptFromString:
               @"document.title"];
    navtitle.title =webtitle;
    [navtitle leftBarButtonItem].title = @"返回";
    //    if ([webtitle isEqual:@"泽臻正品小店"])
    //    {
    //
    //        [leftButton setEnabled:false];
    //    }
    //    else{
    //        [leftButton setEnabled:true];
    //    }
    
    if ([webtitle isEqual:@"待付款的订单"] ||
        [webtitle isEqual:@"等待付款的订单"] ||
        [webtitle isEqual:@"会员主页"] ||
        [webtitle isEqual:@"订单完成"] ||
        [webtitle isEqual:@"优惠码列表"]||
        [webtitle isEqual:@"登录"]
        )
    {
        [rightButton setEnabled:false];
    }
    else
        [rightButton setEnabled:true];
    //    [[LoadingView shareLoadingView:YES] close];
    
    
    [indicator stopAnimationWithLoadText:@"完成" withType:YES];//加载成功
    [self.view exchangeSubviewAtIndex:[[self.view subviews] indexOfObject:effectview] withSubviewAtIndex:[[self.view subviews] indexOfObject:webui]];
    [effectview removeFromSuperview];
    
    
    effectview =Nil;
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    //    [[LoadingView shareLoadingView:YES] show];
    
    //兼容 ios8
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [self setVisualEffect];
    }
    [self.view addSubview:indicator];
    [indicator startAnimation];  //开始转动
    return;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
    
    [navtitle leftBarButtonItem].title = @"刷新";
    [effectview removeFromSuperview];
    //     [[LoadingView shareLoadingView:NO] close];
    [indicator stopAnimationWithLoadText:@"失败" withType:NO];//加载成功
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIImage *)imageFromView: (UIView *) theView atFrame:(CGRect)r
{
    
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(r);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGContextRestoreGState(context);
    return theImage;
}

@end


