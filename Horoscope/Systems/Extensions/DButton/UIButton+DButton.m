//
//  UILabel+FontSizeFit.m
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import "UIButton+DButton.h"
#import "DUIFont.h"
#import "DUIFont+App.h"
#import "Constant.h"

@implementation UIButton (DButton)


-(void)initWithAppPropertiesCircleRadius
{
    self.backgroundColor = kDefaultThemeColorTopbar;
    self.titleLabel.textColor = kDefaultThemeColorTopbar;
    self.layer.cornerRadius = 7;
    self.hidden = YES;
}


-(void)initWithAppPropertiesWithTitle:(NSInteger)cnt
{
    self.hidden = YES;
    if (cnt>0) {
        self.hidden = NO;
        [self setTitle:[NSString stringWithFormat:@"%d",(int)cnt] forState:UIControlStateNormal];
        [self.titleLabel setFont:[DUIFont DfontRoboto_MediumWithSize:kDefaultFontSizeSmall]];
        
    }
}

@end
