//
//  koudaitong.m
//  泽臻小店
//
//  Created by xiaoguang yang on 15/4/18.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import "koudaitong.h"


NSString *const appid =@"91fce6335e1cb6546c";
NSString *const AppSecert =@"bcf7ca597de5f942e545c071aa76e3d1";
NSString *const mainURl =@"http://open.koudaitong.com/api/entry?";

@implementation koudaitong




// 获得商品信息查询参数
+(NSDictionary *)getGoodsParams:(NSString*)paramas
{
    
    
    NSDictionary *maindictionary = [[NSDictionary alloc] initWithObjectsAndKeys:paramas,@"q",                                    @"num_iid,title,cid,desc,origin_price,pic_url,pic_thumb_url,price,detail_url",@"fields",nil];
    
    return maindictionary;
    
}


+(NSDictionary *)addGoodsParams:(NSString*)paramas
{
    
    
    NSDictionary *maindictionary = [[NSDictionary alloc] initWithObjectsAndKeys:paramas,@"q",                                    @"num_iid",@"fields",nil];
    
    return maindictionary;
    
}


+(NSDictionary *)getURl:(NSString *)method
{
    //    app_id=91fce6335e1cb6546c
    //    format=json
    //    method=kdt.item.get
    //    num_iid=3838293428
    //    sign_method=md5
    //    timestamp=2013-05-06 13:52:03
    //    v=1.0
    //     http://open.koudaitong.com/api/entry?sign=74d4c18b9f077ed998feb10e96c58497&timestamp=2013-05-06%2013:52:03&v=1.0&app_id=test&method=kdt.item.get&sign_method=md5&format=json&num_iid=3838293428
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    
    
    NSDictionary *maindictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    appid,@"app_id",//appid
                                    method,@"method", //调用的方法
                                    currentDateStr,@"timestamp",
                                    @"json",@"format",
                                    @"1.0",@"v",
                                    @"md5",@"sign_method",
                                 
//                                    @"",@"sign",
                                    nil];
    
    return maindictionary;
}



+(NSString *)encodeDictionary:(NSDictionary*)dictionary
              paramdictionary:(NSDictionary *)paramsdictionary {
    
    NSMutableArray *parts = [[NSMutableArray alloc] init];
    for (NSString *key in dictionary) {
        NSString *encodedValue = [[dictionary objectForKey:key] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *encodedKey = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *part = [NSString stringWithFormat: @"%@=%@", encodedKey, encodedValue];
        [parts addObject:part];
    }
    
    if (paramsdictionary !=nil)
    {
        for (NSString *key in paramsdictionary) {
            NSString *encodedValue = [paramsdictionary objectForKey:key];
            NSString *encodedKey = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSString *part = [NSString stringWithFormat: @"%@=%@", encodedKey, encodedValue];
            [parts addObject:part];
        }
    }
    NSArray *resultArray = [parts sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        return [obj1 compare:obj2 options:NSLiteralSearch];
    }];
    
    
    NSMutableString *params = [[NSMutableString alloc] init];

 
    /**
     *  重新组合参数
     */
    for (NSString *param in resultArray)
    {
        
        [params appendString:[param stringByReplacingOccurrencesOfString:@"=" withString:@""]];
        
    }
    [params insertString:AppSecert atIndex:0];
    [params appendString:AppSecert];
   
   
    NSString *newparams = [params stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
     NSLog(@"参数组合 %@",newparams);
    NSString *secret =[self MD5:newparams];
     NSLog(@"MD5 %@",secret);
    [parts addObject:[NSString stringWithFormat:@"sign=%@",secret]];
    
    
    NSString *encodedDictionary = [parts componentsJoinedByString:@"&"];
    return [NSString stringWithFormat:@"%@%@",mainURl, encodedDictionary];
}

/**
 *  十六位MD5
 *
 *  @param str 字符串
 *
 *  @return MD5
 */
+(NSString *)MD5:(NSString *)str
{
    
    const char *charstr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(charstr, strlen(charstr), result);
    
    
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],result[1],result[2],result[3],
            result[4],result[5],result[6],result[7],
            result[8],result[9],result[10],result[11],
            result[12],result[13],result[14],result[15]];
//            result[16], result[17],result[18], result[19],
//            result[20], result[21],result[22], result[23],
//            result[24], result[25],result[26], result[27],
//            result[28], result[29],result[30], result[31]];
}


+(BOOL)sendHttpUrl:(NSString *)Url httpdelegate:(NSObject<NSURLConnectionDataDelegate> *)view
{
    NSURL *koudaitongurl = [NSURL URLWithString:[Url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:koudaitongurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:view];

    if (connection)
        return YES;
    else
        return NO;
    
    
    
    
}
@end
