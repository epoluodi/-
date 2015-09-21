//
//  LoadingView.h
//  VMPTS
//
//  Created by xiaoguang yang on 15-1-2.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView
{
    ///指示器
    UIActivityIndicatorView *indicatorView;
    ///包含指示器和文字的view
    UIView *conerView;
}
///是否是模拟同步
@property (nonatomic) BOOL isLikeSynchro;

///显示加载框
- (void)show;

///关闭加载框
- (void)close;

///获取LoadingView单例,isLikeSynchro  Yes:类似同步，通过遮盖整个窗体实现 No:异步
+ (LoadingView *)shareLoadingView:(BOOL)disp;
@end
