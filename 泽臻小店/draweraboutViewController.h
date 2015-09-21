//
//  draweraboutViewController.h
//  泽臻小店
//
//  Created by xiaoguang yang on 15/5/6.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "settingcell.h"
#import "FirstViewController.h"
#import "TencentClass.h"
#import "JVFloatingDrawer.h"
#import "SecondViewController.h"
@class AppDelegate;
@class JVFloatingDrawer;
@interface draweraboutViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,queryparams,swtichdelgate>

{
    UINib *nib;
    UIAlertController *uv;
    AppDelegate *appdelegate;
    WBMessageObject *msg;
    

}

@property (strong,nonatomic) JVFloatingDrawer* drawerview;

@property (weak, nonatomic) IBOutlet UITableView *tableview;

-(void)switchmode:(id)object;

@end
