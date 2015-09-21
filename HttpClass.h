//
//  HttpClass.h
//  HttpClass
//
//  Created by 程嘉雯 on 15/5/27.
//  Copyright (c) 2015年 com.epoluodi.lib. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "info.h"


@interface HttpClass : NSObject <NSURLConnectionDelegate>
{
    NSMutableArray *mutableArrary;
    NSMutableData *recivedata;
    NSObject <Httpdelegate> *viewdelegate;
}

@property (strong,nonatomic)NSString *WebServiceUrl;


-(instancetype)init;
-(instancetype)init:(NSString *)url;

-(void)clearArray;
-(void)addParamsString:(NSString *)key values:(NSString *)values;
-(NSData*)dataEncodeDictionary:(NSDictionary*)dictionary;
-(NSData *)getDataForArrary;


-(NSData *)httprequest:(NSData *)body;
-(BOOL)httprequest:(NSData *)body
                delegate:(NSObject<Httpdelegate> *)delegate;





@end


