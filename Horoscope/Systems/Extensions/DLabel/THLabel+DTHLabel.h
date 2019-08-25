//
//  UILabel+FontSizeToFit.h
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THLabel.h"
#import "Constant.h"


@interface THLabel(DTHLabel)


-(void)initTHPropertiesSize:(CGFloat)size Type:(DFontType)type;
-(void)initTHTitlePropertiesSize:(CGFloat)size Type:(DFontType)type;

@end
