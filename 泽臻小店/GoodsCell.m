//
//  GoodsCell.m
//  泽臻小店
//
//  Created by xiaoguang yang on 15/4/17.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import "GoodsCell.h"

@implementation GoodsCell
@synthesize goodtitle;
@synthesize goodprice;
@synthesize goodfrom;
@synthesize goodimage;
@synthesize goodtaobaoprice;

- (void)awakeFromNib {
    // Initialization code
    goodtitle.adjustsFontSizeToFitWidth=YES;
    goodtitle.minimumScaleFactor=14;
    
}

-(instancetype)init
{
    goodimage.backgroundColor =[UIColor clearColor];
    return [super init];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCelllInfo:(NSDictionary *)infodictionary
{
    
    goodtitle.text =[infodictionary objectForKey:@"title"];
    goodtaobaoprice.text =[infodictionary objectForKey:@"origin_price"];
    goodprice.text =[NSString stringWithFormat:@"心动价:%@" ,[infodictionary objectForKey:@"price"]];
    
    
    dispatch_queue_t globalQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t mainQ = dispatch_get_main_queue();
    
    dispatch_async(globalQ, ^{
          NSURL *imgurl = [NSURL URLWithString:[infodictionary objectForKey:@"pic_thumb_url"]];
        NSData * data = [NSData dataWithContentsOfURL:imgurl];

        if (data != nil) {
            dispatch_async(mainQ, ^{
                CATransition *transition = [CATransition animation];
                
                transition.duration = 0.5f;
                transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
                transition.type =kCATransitionPush;
                transition.subtype = kCATransitionFromTop;
                goodimage.image = [UIImage imageWithData:data];
                [goodimage.layer  addAnimation:transition forKey:nil];
            });   
        }   
    });
    
   
 

    
   
}



@end
