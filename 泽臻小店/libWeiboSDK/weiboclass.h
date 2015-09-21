//
//  weiboclass.h
//  泽臻小店
//
//  Created by xiaoguang yang on 15-3-26.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboSDK.h"

#define kAppKey         @"3272722627"
#define kRedirectURI    @"http://www.sina.com"

@interface weiboclass : NSObject<WeiboSDKDelegate>

@property (strong, nonatomic) NSString *wbtoken;
@property (strong, nonatomic) NSString *wbCurrentUserID;


-(void)sendweibo:(WBMessageObject *)weibomessage;

@end
