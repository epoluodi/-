//
//  SheetUI.h
//  VMTSAPP
//
//  Created by appie on 15-1-19.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Common.h"

@interface SheetUI : NSObject
{
    NSObject<queryparams> *queryview;
}

-(id)initclass:(NSObject<queryparams> *) mainview;
-(UIAlertController *)SHowSheetQuery1:(int)model;
-(UIActionSheet *)SHowSheetQuery_IOS7;
@end
