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

@interface UITextView (DTextView)


-(void)initWithAppPropertiesSize:(CGFloat)size Type:(DFontType)type;
-(void)initWithAppPropertiesColorSec;
-(void)initWithAppPropertiesColorPrim;
-(void)initWithAppPropertiesColorTer;
-(void)initWithAppPropertiesColorPrimaryLight;
-(void)initWithAppPropertiesHead;
-(void)initWithAppPropertiesColorWhite;
-(void)initWithAppPropertiesColorPrimDark;
-(void)initWithAppPropertiesSetBorder;

@end
