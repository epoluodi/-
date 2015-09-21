//
//  contactview.h
//  泽臻小店
//
//  Created by xiaoguang yang on 15/4/26.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "settingcell.h"
#import "FirstViewController.h"
#import "TencentClass.h"
#import "mainViewController.h"
#import "SecondViewController.h"
@class AppDelegate;
@class mainViewController;
@interface contactview : UIViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,queryparams,swtichdelgate>

{
    UINib *nib;
    UIAlertController *uv;
    AppDelegate *appdelegate;
     WBMessageObject *msg;
    mainViewController *rootview;
}


@property (weak, nonatomic) IBOutlet UIImageView *imagehead;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

-(void)switchmode:(id)object;

@end
