//
//  UILabel+FontSizeFit.m
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import "UILabel+DLabel.h"
#import "DUIFont.h"
#import "LocalisedStrings.h"
#import "DUIFont+App.h"

@implementation UILabel (DLabel)


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

-(void)initWithAppPropertiesList_Title
{
    [self setFont:[DUIFont initWithAppFont_List_Title]];
}

-(void)initWithAppPropertiesList_SubTitle
{
    [self setFont:[DUIFont initWithAppFont_List_Subtitle]];
}

-(void)initWithAppPropertiesList_SubOfSubTitle
{
    [self setFont:[DUIFont initWithAppFont_List_SubofSubtitle]];
}

-(void)initWithAppProperties_All_HeaderLableTitle
{
    [self setFont:[DUIFont initWithAppFont_All_HeaderLableTitle]];
    self.textColor = kDefaultTextColorTertiary;

}

-(void)initWithAppProperties_All_DialogTitle
{
    [self setFont:[DUIFont initWithAppFont_All_DialogLableTitle]];
    self.textColor = kDefaultTextColorPrimary;
}


-(void)initWithAppPropertiesTitleLightSize:(CGFloat)size Type:(DFontType)type{
    
    
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

    self.textColor = kDefaultThemeColorTopbar;
}

-(void)initWithAppPropertiesErrorSize:(CGFloat)size Type:(DFontType)type{
    
    self.textColor = kDefaultTextColorDivider;
    self.textAlignment = NSTextAlignmentCenter;
    self.text = [Helpers localisedString:LK_ANDROID_there_is_nothing];
    
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

-(void)initWithAppPropertiesTextShadow:(CGFloat)size Type:(DFontType)type
{
    self.textColor = [UIColor whiteColor];
    self.textAlignment = NSTextAlignmentCenter;
    self.backgroundColor = [UIColor clearColor];
    self.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(2.0f, 0.0f);
    self.layer.shadowOpacity = 1.0f;
    self.layer.shadowRadius = 1.0f;
    
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

-(void)initWithAppPropertiesSpashFontStyle{
    
    //self.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.87];
    self.textColor = kDefaultLabelTextColorWhite;
    [self setFont:[DUIFont DfontItalicTypeWriter_RegularWithSize:kDefaultFontSizeExtraLarge36]];
}

-(void)initWithAppPropertiesColorAccent{
    
    //self.textColor = [UIColor colorWithRed:288 green:288 blue:288 alpha:1.0];
    self.textColor = kDefaultThemeColorAccent;
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

-(void)initWithAppPropertiesColorRedFavourite{
    
    //self.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.87];
    self.textColor = kDefaultTextColorRedFavourite;
}

-(void)initWithAppPropertiesColorDevi{
    
    //self.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.87];
    self.textColor = kDefaultTextColorDivider;
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


-(void)initWithAppPropertiesColorTopbarLight{
    
    //self.textColor = [UIColor colorWithRed:288 green:288 blue:288 alpha:1.0];
    self.textColor = kDefaultThemeColorTopbarLight;
}

-(void)initWithAppPropertiesColorTopbar{
    
    //self.textColor = [UIColor colorWithRed:288 green:288 blue:288 alpha:1.0];
    self.textColor = kDefaultThemeColorTopbar;
}


@end
