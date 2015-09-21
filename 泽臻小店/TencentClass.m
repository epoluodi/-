//
//  TencentClass.m
//  泽臻小店
//
//  Created by xiaoguang yang on 15/5/2.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import "TencentClass.h"

@implementation TencentClass
@synthesize oauth;
@synthesize openid;

-(instancetype)init
{
    NSString *appid =QQAPPID;
    oauth=[[TencentOAuth alloc] initWithAppId:appid andDelegate:self];
    openid = oauth.openId;
    
    return [super init];
    
}


-(void)sendtxtmsg:(NSString *)msg
{
    QQApiTextObject* txtObj;
    SendMessageToQQReq* req;
    txtObj = [QQApiTextObject objectWithText:msg];
    req = [SendMessageToQQReq reqWithContent:txtObj];
    
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    

}
- (void) sendNewMsg:(NSString *)strurl pngname:(NSData *)imgdata title:(NSString*)title desc:(NSString *)desc
{
    
    if (![TencentOAuth iphoneQQInstalled])
        return;
    
         NSURL* url = [NSURL URLWithString:strurl];
//    NSURL *imgurl = [NSURL URLWithString:@"http://imgqn.koudaitong.com/upload_files/2015/04/30/FtsiIKONm115k2eqHFRK1NDX-nuy.jpg!490x490+2x.jpg"];
    
         QQApiNewsObject* img = [QQApiNewsObject objectWithURL:url title:title description:desc previewImageData:imgdata];
    
//             QQApiNewsObject* img = [QQApiNewsObject objectWithURL:url title:title description:desc previewImageURL:imgurl];
    
    
         SendMessageToQQReq* req = [SendMessageToQQReq reqWithContent:img];
         
         QQApiSendResultCode sent = [QQApiInterface sendReq:req];
            NSLog(@"%@",self);
}


-(void)sendQQWPA
{
    QQApiWPAObject *wpaObj = [QQApiWPAObject objectWithUin:@"931133932"];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:wpaObj];
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
   
}

-(void)addQQfriend
{
    QQApiAddFriendObject *addQQobject = [[QQApiAddFriendObject alloc] initWithOpenID:openid];
    addQQobject.description = @"好朋友";
    addQQobject.subID = nil;
    addQQobject.remark = @"好朋友";
    SendMessageToQQReq* req = [SendMessageToQQReq
                               reqWithContent:addQQobject];
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
}

@end
