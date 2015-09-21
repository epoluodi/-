//
//  Common.m
//  VMTSAPP
//
//  Created by appie on 15-1-6.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "Common.h"

@implementation Common



+(struct Deviceinfo )DeviceName
{
    struct Deviceinfo deviceinfo;

  
    deviceinfo.dmodel =[UIDevice currentDevice].model;
    deviceinfo.dname = [UIDevice currentDevice].systemName;
    return deviceinfo;
    
}
+(CGRect)GetALLScreen
{
    CGRect r = [ UIScreen mainScreen ].applicationFrame;
    return r;
}


+(CGRect)GetScreen
{
    CGRect r = [ UIScreen mainScreen ].bounds;
    return r;
}



@end
