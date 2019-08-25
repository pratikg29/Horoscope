//
//  UILabel+FontSizeFit.m
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import "UITextField+DTextField.h"
#import "DUIFont.h"
#import "DUIFont+App.h"


@implementation UITextField (DTextField)


-(void)initWithAppPropertiesSize:(CGFloat)size Type:(DFontType)type{
    
    
    
    /* CALayer *border = [CALayer layer];
     CGFloat borderWidth = 2;
     border.borderColor = [UIColor darkGrayColor].CGColor;
     border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, self.frame.size.height);
     border.borderWidth = borderWidth;
     [self.layer addSublayer:border];
     self.layer.masksToBounds = YES;*/
    
    
    
    /*[self.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
     [self.layer setBorderColor: [[UIColor grayColor] CGColor]];
     [self.layer setBorderWidth: 0.0];
     //[self.layer setCornerRadius:12.0f];
     [self.layer setMasksToBounds:NO];
     [self.layer setShadowRadius:2.0f];
     self.layer.shadowColor = [[UIColor blackColor] CGColor];
     self.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
     self.layer.shadowOpacity = 0.2f;
     self.layer.shadowRadius = 0.8f;*/
    
    
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

-(void)initWithAppPropertiesTextFieldBottomBorder
{
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 1;
    border.borderColor = [UIColor darkGrayColor].CGColor;
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, self.frame.size.height);
    border.borderWidth = borderWidth;
    [self.layer addSublayer:border];
    self.layer.masksToBounds = YES;
}


@end
