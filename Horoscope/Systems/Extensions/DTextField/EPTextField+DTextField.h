//
//  UILabel+FontSizeToFit.h
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "EPTextField.h"
//#import "DUIFont.h"

@interface EPTextField (DTextField)


-(void)initWithAppPropertiesSize:(CGFloat)size Type:(DFontType)type Placeholder:(NSString *)Placeholder;
-(void)initWithAppPropertiesWithBorderSize:(CGFloat)size Type:(DFontType)type Placeholder:(NSString *)Placeholder;
-(void)initWithAppBorderWith_Form_Placeholder:(NSString *)Placeholder;
-(void)initWithAppBorderWithout_Form_Placeholder:(NSString *)Placeholder;



@end
