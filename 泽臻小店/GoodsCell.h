//
//  GoodsCell.h
//  泽臻小店
//
//  Created by xiaoguang yang on 15/4/17.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *goodimage;
@property (weak, nonatomic) IBOutlet UILabel *goodtitle;
@property (weak, nonatomic) IBOutlet UILabel *goodfrom;
@property (weak, nonatomic) IBOutlet UILabel *goodprice;
@property (weak, nonatomic) IBOutlet UILabel *goodtaobaoprice;


-(void)setCelllInfo:(NSDictionary *)infodictionary;

@end
