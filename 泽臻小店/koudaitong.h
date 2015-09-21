//
//  koudaitong.h
//  泽臻小店
//
//  Created by xiaoguang yang on 15/4/18.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>




@interface koudaitong : NSObject


+(NSDictionary *)getGoodsParams:(NSString*)paramas;
+(NSDictionary *)getURl:(NSString *)method;
+(NSString *)encodeDictionary:(NSDictionary*)dictionary
              paramdictionary:(NSDictionary *)paramsdictionary;
+(BOOL)sendHttpUrl:(NSString *)Url httpdelegate:(NSObject<NSURLConnectionDataDelegate> *)view;

@end
