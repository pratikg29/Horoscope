//
//  UIFont+NVRL8.m
//  NVRL8
//
//  Created by Taleb Atoui on 11/24/15.
//  Copyright (c) 2015 Cleartag. All rights reserved.
//
#import "Constant.h"
#import "DUIFont.h"

@implementation DUIFont

+(UIFont *)selfFontSizeWithName:(NSString *)fontName size:(CGFloat)size
{
    
    if(D_IS_IPHONE_5)
    {
        size = size - kDefaultIPHONE5;
    }
    else if(D_IS_IPAD)
    {
        size = size + kDefaultIPAD;
    }
    
    return [UIFont fontWithName:fontName size:size];
}

+(UIFont *)DfontRoboto_RegularWithSize:(CGFloat)size
{
    return [self selfFontSizeWithName:kDefaultFontRobotoRegular size:size];
    
}

+(UIFont *)DfontRoboto_MediumWithSize:(CGFloat)size
{
    return [self selfFontSizeWithName:kDefaultFontRobotoMedium size:size];
    
}

+(UIFont *)DfontRoboto_BoldWithSize:(CGFloat)size
{
    return [self selfFontSizeWithName:kDefaultFontRobotoBold size:size];
}

+(UIFont *)DfontRoboto_LightWithSize:(CGFloat)size
{
    return [self selfFontSizeWithName:kDefaultFontRobotoLight size:size];
}


+(UIFont *)DfontItalicTypeWriter_RegularWithSize:(CGFloat)size
{
    return [self selfFontSizeWithName:kDefaultFontItalicTypeWriter size:size];
    
}

@end
