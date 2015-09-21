//
//  WeChatClass.m
//  泽臻小店
//
//  Created by xiaoguang yang on 15-3-11.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import "WeChatClass.h"

@implementation WeChatClass


-(void) onReq:(BaseReq*)req
{
    return;
}


-(void) onResp:(BaseResp*)resp
{
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        NSString *strTitle = [NSString stringWithFormat:@"发送媒体消息结果"];
        NSString *strMsg = [NSString stringWithFormat:@"errcode:%d", resp.errCode];
        NSLog(@"%@-%@",strTitle,strMsg);
        

    }
}

///发送文字消息
- (void) sendTextContent:(NSString *)strText WXScene:(enum WXScene)_scene
{
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.text = strText;
    req.bText = YES;
    req.scene = _scene;
    [WXApi sendReq:req];
}

///发送图文链接消息
- (void) sendLinkContent:(NSString *)strtitle Desc:(NSString *)strdesc URL:(NSString *)strurl Image:(UIImage *)img WXScene:(enum WXScene)_scene
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = strtitle;
    message.description = strdesc;
    [message setThumbImage:img];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = strurl;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}


@end
