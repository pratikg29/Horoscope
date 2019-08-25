//
//  UILabel+FontSizeFit.m
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import "THLabel+DTHLabel.h"
#import "DUIFont.h"

@implementation THLabel(DTHLabel)

-(void)initSelfSize:(CGFloat)size Type:(DFontType)type
{
    /*if (type==DFONTREGULAR) {
        [self setFont:[UIFont DfontRoboto_RegularWithSize:size]];
    }
    else if (type==DFONTMEDIUM) {
        [self setFont:[UIFont DfontRoboto_MediumWithSize:size]];
    }
    else if (type==DFONTLARGE) {
        [self setFont:[UIFont DfontRoboto_BoldWithSize:size]];
    }*/
    [self setFont:[DUIFont DfontRoboto_RegularWithSize:size]];
}

-(void)initTHPropertiesSize:(CGFloat)size Type:(DFontType)type{
    
    [self initSelfSize:size Type:type];
    NSLog(@"%f-%f",D_SCREEN_WIDTH,D_SCREEN_HEIGHT);
    // Demonstrate shadow blur.
    self.shadowColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    self.shadowOffset = kDefaultShadowOffset;
    self.shadowBlur = kDefaultShadowBlur;
    
    // Demonstrate inner shadow.
    self.innerShadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    self.innerShadowOffset = kDefaultInnerShadowOffset;
    self.innerShadowBlur = kDefaultInnerShadowBlur;
    
    // Demonstrate stroke.
    self.strokeColor = kDefaultStrokeColor;
    self.strokeSize = kDefaultStrokeSize;

}

-(void)initTHTitlePropertiesSize:(CGFloat)size Type:(DFontType)type{
    
    [self initSelfSize:size Type:type];
    
    CGRect oldFrame = self.frame;
    int Ypos = 24;
    
    if(D_IS_IPHONE_4_OR_LESS)
    {
        Ypos = Ypos;
    }
    else if(D_IS_IPHONE_5)
    {
        Ypos = Ypos;
    }
    else if(D_IS_IPHONE_6){
        Ypos = Ypos + 5;
    }
    else if(D_IS_IPHONE_6P){
        Ypos = Ypos + 5;
    }
    else{
        Ypos = Ypos + 9;
    }

    CGRect newFrame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y+Ypos, oldFrame.size.width, oldFrame.size.height);
    self.frame = newFrame;
    
    // Demonstrate shadow blur.
    self.shadowColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    self.shadowOffset = kDefaultShadowOffset;
    self.shadowBlur = kDefaultShadowBlur;
    
    // Demonstrate inner shadow.
    self.innerShadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    self.innerShadowOffset = kDefaultInnerShadowOffset;
    self.innerShadowBlur = kDefaultInnerShadowBlur;
    
    // Demonstrate stroke.
    self.strokeColor = kDefaultStrokeColor;
    self.strokeSize = kDefaultStrokeSize;
    
}



@end
