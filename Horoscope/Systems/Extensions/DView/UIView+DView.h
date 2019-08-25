//
//  UILabel+FontSizeToFit.h
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
//#import "DUIFont.h"

@interface UIView (DView)

-(void)initWithAppViewProperties;
-(void)initWithAppHeaderProperties;
-(void)initWithAppCellProperties;
-(void)initWithAppCellTopCornerProperties;
-(void)initWithAppCellWithoutCornerProperties;
-(void)initWithAppPropertiesBackground;
-(void)initWithAppPropertiesTopbar;
-(void)initWithAppPropertiesHeader;
-(void)initWithAppDialogViewProperties;
-(void)initWithAppDialogToastViewProperties;
-(void)initWithAppDialogBackgroundViewProperties;
-(void)initWithAppPropertiesCircle;
-(void)initWithAppPropertiesRightAndBottomShadow;


-(void)initWithWhiteTransparent;
@end
