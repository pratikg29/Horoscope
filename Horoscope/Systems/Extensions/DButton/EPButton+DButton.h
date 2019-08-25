//
//  UILabel+FontSizeToFit.h
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "EPButton.h"
//#import "DUIFont.h"

@interface EPButton (DButton)

-(void)initWithAppPropertiesSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesWhiteSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesFlatSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesErrorSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesFloatSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesDialogButtonsSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesNewSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesSend:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesButtonsSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesButtonBorderSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppButton_Title;
//-(void)initWithAppPropertiesFloatBackButtonSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppButtonShadowProperties;
-(void)initWithAppPropertiesTransitionHide;
-(void)initWithAppPropertiesTransitionShow;
-(void)initWithAppPropertiesBottomSideBorder;
-(void)initWithAppPropertiesWhite;
-(void)initWithAppPropertiesPrimaryColor;
-(void)initWithAppPropertiesButtonRippleOnly;
-(void)initWithAppPropertiesHeaderColor;
@end
