//
//  settingcell.m
//  泽臻小店
//
//  Created by xiaoguang yang on 15/4/26.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import "settingcell.h"
#import "Common.h"
@implementation settingcell
@synthesize title;
@synthesize imageico;


- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)init
{
    [self.selectedBackgroundView setBackgroundColor:[UIColor redColor]];
    
    
    return [super init];
}

-(void)setCellInfo:(NSString *)imagename title:(NSString *)titleinfo
{
    imageico.image = [UIImage imageNamed:imagename];
    title.text =titleinfo;
}

-(void)setcellModel1:(NSObject<swtichdelgate> *)view x:(int)x
{
    UISwitch *modelswitch = [[UISwitch alloc] init];
       modelswitch.frame= CGRectMake([Common GetALLScreen].size.width -modelswitch.frame.size.width-x ,imageico.frame.origin.y-5
                                     ,modelswitch.frame.size.width, modelswitch.frame.size.height);
    self.accessoryType = UITableViewCellAccessoryNone;
    [modelswitch addTarget:view action:@selector(switchmode:) forControlEvents:UIControlEventValueChanged];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
  
        modelswitch.on=[user boolForKey:@"uimode"];
    
    [self addSubview:modelswitch];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
