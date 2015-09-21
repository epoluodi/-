//
//  goodsview.h
//  泽臻小店
//
//  Created by xiaoguang yang on 15/4/17.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsCell.h"
#import "koudaitong.h"
#import "YYAnimationIndicator.h"
#import "FirstViewController.h"

@interface goodsview : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate,
UIAlertViewDelegate>
{
    UIBarButtonItem *rightButton;
    UIBarButtonItem *leftButton;
    UINavigationItem *navtitle;
    NSMutableData *recivedata;
    UIVisualEffectView *effectview;
    YYAnimationIndicator *indicator;
    int datalen;
    NSArray *dataarray;
}

@property (weak, nonatomic) IBOutlet UINavigationBar *navbar;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (weak, nonatomic) IBOutlet UISearchBar *searchtext;

@end
