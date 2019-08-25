//
//  UILabel+FontSizeFit.m
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import "EPTextField+DTextField.h"
#import "DUIFont.h"
#import "DUIFont+App.h"

@implementation EPTextField (DTextField)


-(void)initWithAppPropertiesSize:(CGFloat)size Type:(DFontType)type Placeholder:(NSString *)Placeholder{
    
    self.placeholder = Placeholder;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.floatingPlaceholderEnabled = true;
    self.tintColor = kDefaultTextColorPrimaryDark;
    self.textColor = [UIColor blackColor];
    self.rippleLocation = EPRippleLocationRight;
    self.cornerRadius = 0;
    self.bottomBorderEnabled = true;
    
    self.tag = 3;
    [self setValue:kDefaultTextColorSecondary forKeyPath:@"_placeholderLabel.textColor"];
    
    if (type==DFONTREGULAR) {
        [self setFont:[DUIFont DfontRoboto_RegularWithSize:size]];
    }
    else if (type==DFONTMEDIUM) {
        [self setFont:[DUIFont DfontRoboto_MediumWithSize:size]];
    }
    else if (type==DFONTLARGE) {
        [self setFont:[DUIFont DfontRoboto_BoldWithSize:size]];
    }
    else if (type==DFONTLIGHT) {
        [self setFont:[DUIFont DfontRoboto_LightWithSize:size]];
    }
    
}

-(void)initWithAppPropertiesWithBorderSize:(CGFloat)size Type:(DFontType)type Placeholder:(NSString *)Placeholder{
    
    self.placeholder = Placeholder;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.floatingPlaceholderEnabled = true;
    self.tintColor = [UIColor whiteColor];
    self.textColor = kDefaultBackgroundColor;
    self.bottomBorderColor = [UIColor whiteColor];
    self.rippleLocation = EPRippleLocationRight;
    self.cornerRadius = 0;
    self.bottomBorderEnabled = true;
    
    self.tag = 3;
    [self setValue:kDefaultTextfieldWhitePlaceholder forKeyPath:@"_placeholderLabel.textColor"];
    
    if (type==DFONTREGULAR) {
        [self setFont:[DUIFont DfontRoboto_RegularWithSize:size]];
    }
    else if (type==DFONTMEDIUM) {
        [self setFont:[DUIFont DfontRoboto_MediumWithSize:size]];
    }
    else if (type==DFONTLARGE) {
        [self setFont:[DUIFont DfontRoboto_BoldWithSize:size]];
    }
    else if (type==DFONTLIGHT) {
        [self setFont:[DUIFont DfontRoboto_LightWithSize:size]];
    }
}

-(void)initWithAppBorderWith_Form_Placeholder:(NSString *)Placeholder
{
    self.placeholder = Placeholder;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.floatingPlaceholderEnabled = true;
    self.tintColor = kDefaultTextColorPrimaryDark;
    self.textColor = [UIColor blackColor];
    self.rippleLocation = EPRippleLocationCenter;
    self.cornerRadius = 0;
    self.bottomBorderEnabled = true;
    
    self.tag = 3;
    [self setValue:kDefaultTextColorSecondary forKeyPath:@"_placeholderLabel.textColor"];
    
    [self setFont:[DUIFont initWithAppFont_Form_Placeholder]];
}

-(void)initWithAppBorderWithout_Form_Placeholder:(NSString *)Placeholder
{
    self.placeholder = Placeholder;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.floatingPlaceholderEnabled = true;
    self.tintColor = [UIColor whiteColor];
    self.textColor = kDefaultBackgroundColor;
    self.bottomBorderColor = [UIColor whiteColor];
    self.rippleLocation = EPRippleLocationRight;
    self.cornerRadius = 0;
    self.bottomBorderEnabled = true;
    
    self.tag = 3;
    [self setValue:kDefaultTextfieldWhitePlaceholder forKeyPath:@"_placeholderLabel.textColor"];
    
    [self setFont:[DUIFont initWithAppFont_Form_Placeholder]];
}

@end
