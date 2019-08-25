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

@interface UILabel (DLabel)


-(void)initWithAppPropertiesSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesColorSec;
-(void)initWithAppPropertiesColorAccent;
-(void)initWithAppPropertiesColorPrim;
-(void)initWithAppPropertiesColorTer;
-(void)initWithAppPropertiesColorPrimaryLight;
-(void)initWithAppPropertiesHead;
-(void)initWithAppPropertiesColorDevi;
-(void)initWithAppPropertiesColorWhite;
-(void)initWithAppPropertiesColorPrimDark;
-(void)initWithAppPropertiesColorRedFavourite;
//-(void)initWithAppPropertiesColorTopbarLight;
-(void)initWithAppPropertiesColorTopbar;
-(void)initWithAppPropertiesTitleLightSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesErrorSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesSpashFontStyle;
-(void)initWithAppPropertiesTextShadow:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesList_SubOfSubTitle;
-(void)initWithAppPropertiesList_SubTitle;
-(void)initWithAppPropertiesList_Title;
-(void)initWithAppProperties_All_HeaderLableTitle;
-(void)initWithAppProperties_All_DialogTitle;

@end
