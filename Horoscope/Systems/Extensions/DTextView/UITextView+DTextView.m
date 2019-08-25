//
//  UILabel+FontSizeFit.m
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import "UITextView+DTextView.h"
#import "DUIFont.h"

@implementation UITextView (DTextView)


-(void)initWithAppPropertiesSize:(CGFloat)size Type:(DFontType)type{
    
       
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

-(void)initWithAppPropertiesSetBorder
{
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 0.6;
    self.layer.cornerRadius = 3.0;
}

-(void)initWithAppPropertiesColorSec{
    
    //self.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.87];
    self.textColor = kDefaultTextColorSecondary;
}

-(void)initWithAppPropertiesColorPrim{
    
    //self.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.87];
    self.textColor = kDefaultTextColorPrimary;
}

-(void)initWithAppPropertiesColorPrimDark{
    
    //self.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.87];
    self.textColor = kDefaultTextColorPrimaryDark;
}

-(void)initWithAppPropertiesColorTer{
    
    //self.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.87];
    self.textColor = kDefaultTextColorTertiary;
}

-(void)initWithAppPropertiesHead{
    
    //self.textColor = [UIColor colorWithRed:288 green:288 blue:288 alpha:1.0];
    self.textColor = kDefaultLabelTextColorWhite;
}

-(void)initWithAppPropertiesColorPrimaryLight{
    
    //self.textColor = [UIColor colorWithRed:288 green:288 blue:288 alpha:1.0];
    self.textColor = kDefaultTextColorPrimaryLight;
}

-(void)initWithAppPropertiesColorWhite{
    
    //self.textColor = [UIColor colorWithRed:288 green:288 blue:288 alpha:1.0];
    self.textColor = kDefaultLabelTextColorWhite;
}


@end
