//
//  settingcell.h
//  泽臻小店
//
//  Created by xiaoguang yang on 15/4/26.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol swtichdelgate

-(void)switchmode:(id)object;

@end


@class contactview;
@interface settingcell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imageico;
@property (weak, nonatomic) IBOutlet UILabel *title;


-(void)setCellInfo:(NSString *)imagename title:(NSString *)titleinfo;
-(void)setcellModel1:(NSObject<swtichdelgate> *)view x:(int)x;
@end


