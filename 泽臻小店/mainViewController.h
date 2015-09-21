//
//  mainViewController.h
//  泽臻小店
//
//  Created by xiaoguang yang on 15-3-19.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "contactview.h"
@interface mainViewController : UITabBarController
{
    NSThread *threadlogin;
   
}
@property BOOL islogin;
@property BOOL isDayCome;

@end
