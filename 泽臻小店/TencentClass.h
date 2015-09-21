//
//  TencentClass.h
//  泽臻小店
//
//  Created by xiaoguang yang on 15/5/2.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TencentOpenAPI/TencentApiInterface.h>
#import <TencentOpenAPI/TencentMessageObject.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentOAuthObject.h>
#import "TencentOpenAPI/QQApiInterface.h"



#define QQAPPID     @"1104504491";

@interface TencentClass : NSObject<TencentSessionDelegate>
{
    
}
@property (nonatomic, retain)TencentOAuth *oauth;
@property (nonatomic, weak)NSString *openid;

-(void)sendtxtmsg:(NSString *)msg;
- (void) sendNewMsg:(NSString *)strurl pngname:(NSData *)imgdata title:(NSString*)title desc:(NSString *)desc;
-(void)sendQQWPA;
-(void)addQQfriend;
@end
