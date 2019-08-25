//
//  UILabel+FontSizeFit.m
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import "EPButton+DButton.h"
#import "DUIFont.h"
#import "DUIFont+App.h"

@implementation EPButton (DButton)


-(void)initWithAppPropertiesSize:(CGFloat)size Type:(DFontType)type{
    
    self.backgroundColor = kDefaultTextColorPrimaryDark;
    self.layer.cornerRadius = 20;
    self.layer.shadowOpacity = 0.55;
    self.layer.shadowRadius = 2.0;
    self.aniDuration = 0.5;
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 1.5);
    self.rippleLayerColor = [UIColor colorWithRed:25.0f/255.0f green:118.0f/255.0f blue:210.0f/255.0f alpha:1.0f];
    
    
}

-(void)initWithAppPropertiesButtonBorderSize:(CGFloat)size Type:(DFontType)type{
    
    self.backgroundColor = kDefaultLabelTextColorWhite;
    [self setTitleColor:kDefaultTextColorPrimaryDark forState:UIControlStateNormal];
    [self.layer setBorderColor:kDefaultTextColorPrimaryDark.CGColor];
    [self.layer setBorderWidth: 1.0f];
    self.layer.cornerRadius = 20;
}


-(void)initWithAppPropertiesNewSize:(CGFloat)size Type:(DFontType)type{
    
    self.backgroundColor = kDefaultThemeColorHeader;
    self.layer.shadowOpacity = 0.55;
    self.layer.shadowRadius = 2.0;
    self.aniDuration = 0.5;
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 1.5);
    self.rippleLayerColor = kDefaultThemeColorTopbar;
    
    
}

-(void)initWithAppPropertiesSend:(CGFloat)size Type:(DFontType)type{
    
    self.backgroundColor = kDefaultThemeColorHeader;
    self.layer.shadowOpacity = 0.55;
    self.layer.shadowRadius = 2.0;
    self.layer.cornerRadius = 0.5 * self.bounds.size.width;
    self.aniDuration = 0.5;
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 1.5);
    self.rippleLayerColor = kDefaultThemeColorTopbar;
    
    
}



-(void)initWithAppPropertiesWhiteSize:(CGFloat)size Type:(DFontType)type{
    
    self.backgroundColor = kDefaultLabelTextColorWhite;
    //self.layer.shadowOpacity = 0.55;
    //self.layer.shadowRadius = 5.0;
    self.aniDuration = 0.5;
    //self.layer.shadowColor = [UIColor grayColor].CGColor;
    //self.layer.shadowOffset = CGSizeMake(0, 2.5);
    self.rippleLayerColor = [UIColor colorWithRed:25.0f/255.0f green:118.0f/255.0f blue:210.0f/255.0f alpha:1.0f];
    
    
}

-(void)initWithAppPropertiesFlatSize:(CGFloat)size Type:(DFontType)type{
    
    [self setTitleColor:kDefaultTextColorPrimaryDark forState:UIControlStateNormal];
    self.maskEnabled = false;
    self.ripplePercent = 0.5;
    self.backgroundAniEnabled = false;
    self.rippleLocation = EPRippleLocationCenter;
    self.contentMode = UIViewContentModeScaleAspectFit;
    
}

-(void)initWithAppPropertiesDialogButtonsSize:(CGFloat)size Type:(DFontType)type{
    
    [self setTitleColor:kDefaultTextColorPrimaryDark forState:UIControlStateNormal];
    self.maskEnabled = false;
    self.ripplePercent = 1.25;
    self.rippleLocation = EPRippleLocationCenter;
    self.aniDuration = 0.85;
    self.contentMode = UIViewContentModeScaleAspectFit;

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

-(void)initWithAppButton_Title
{
    [self.titleLabel setFont:[DUIFont initWithAppFont_All_ButtonTitle]];
     self.rippleLocation = EPRippleLocationCenter;
    [self setTitleColor:kDefaultTextColorPrimaryDark forState:UIControlStateNormal];
}

-(void)initWithAppPropertiesButtonsSize:(CGFloat)size Type:(DFontType)type{
    
    [self setTitleColor:kDefaultThemeColorAccent forState:UIControlStateNormal];
    //self.maskEnabled = false;
    //self.ripplePercent = 0.5;
    //self.rippleLocation = EPRippleLocationCenter;
    self.aniDuration = 0.5;
    self.contentMode = UIViewContentModeScaleAspectFit;
    
    
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


-(void)initWithAppPropertiesErrorSize:(CGFloat)size Type:(DFontType)type{
    
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.maskEnabled = false;
    self.ripplePercent = 0.5;
    self.backgroundAniEnabled = false;
    self.rippleLocation = EPRippleLocationCenter;
    self.contentMode = UIViewContentModeScaleAspectFit;
     [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    
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


-(void)initWithAppPropertiesFloatSize:(CGFloat)size Type:(DFontType)type{
    
    
    //UIImage *image = self.currentImage;
    //[self setImage:[self setThemeColor:image] forState:UIControlStateNormal];
    self.cornerRadius = self.frame.size.width/2;
    self.backgroundLayerCornerRadius = self.frame.size.width/2;
    self.maskEnabled = false;
    self.ripplePercent = 1.75;
    self.rippleLocation = EPRippleLocationCenter;
    self.aniDuration = 0.85;
    self.contentMode = UIViewContentModeScaleAspectFit;
    
    self.layer.shadowOpacity = 0.25;
    self.layer.shadowRadius = 1.5;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.8, 1.5);
    self.backgroundColor = kDefaultThemeColorTopbar;
    
}


-(void)initWithAppPropertiesButtonRippleOnly{    
    //self.maskEnabled = false;
    //self.ripplePercent = 0.25;
    self.rippleLocation = EPRippleLocationRight;
    //self.aniDuration = 0.85;
    //self.contentMode = UIViewContentModeScaleAspectFit;
}


-(void)initWithAppPropertiesTransitionHide{
    
    [self setAlpha:1.0f];
    
    //fade out
    [UIView animateWithDuration:0.2f animations:^{
        
        [self setAlpha:0.0f];
        
    } completion:^(BOOL finished) {
        
        
    }];
}


-(void)initWithAppPropertiesTransitionShow{
    [self setAlpha:0.0f];
    
    //fade in
    [UIView animateWithDuration:0.2f animations:^{
        
        [self setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
        
    }];
}

-(void)initWithAppButtonShadowProperties
{
   // [self.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [self.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [self.layer setBorderWidth: 0.0];
    //[self.layer setCornerRadius:12.0f];
    [self.layer setMasksToBounds:NO];
    [self.layer setShadowRadius:8.0f];
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.layer.shadowOpacity = 0.2f;
    self.layer.shadowRadius = 0.8f;
}


-(UIImage *)setThemeColor :(UIImage *)image{
    
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToMask(context, rect, image.CGImage);
    CGContextSetFillColorWithColor(context, [kDefaultThemeColorButton CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *flippedImage = [UIImage imageWithCGImage:img.CGImage
                                                scale:1.0 orientation: UIImageOrientationDownMirrored];
    
    return flippedImage;
    
    
}

-(void)initWithAppPropertiesBottomSideBorder
{
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 1;
    border.borderColor = [UIColor darkGrayColor].CGColor;
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, self.frame.size.height);
    border.borderWidth = borderWidth;
    [self.layer addSublayer:border];
    self.layer.masksToBounds = YES;
}

-(void)initWithAppPropertiesWhite{
    
    
    [self setTitleColor:kDefaultLabelTextColorWhite forState:UIControlStateNormal];
}


-(void)initWithAppPropertiesPrimaryColor{
    
    [self setTitleColor:kDefaultThemeColorTopbar forState:UIControlStateNormal];
}
-(void)initWithAppPropertiesHeaderColor{
    
    [self setTitleColor:kDefaultThemeColorHeader forState:UIControlStateNormal];
}

@end
