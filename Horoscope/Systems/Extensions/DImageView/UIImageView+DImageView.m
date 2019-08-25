//
//  UILabel+FontSizeFit.m
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import "UIImageView+DImageView.h"
#import "DUIFont.h"

@implementation UIImageView (DImageView)


-(void)initWithAppProperties{
    
    UIImage *image = self.image;
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToMask(context, rect, image.CGImage);
    CGContextSetFillColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *flippedImage = [UIImage imageWithCGImage:img.CGImage
                                                scale:1.0 orientation: UIImageOrientationDownMirrored];
    
    self.image = flippedImage;
   
    
}


-(void)initWithAppPropertiesThemeColor{
    
    UIImage *image = self.image;
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
    
    self.image = flippedImage;
    
    
}

-(void)initWithAppPropertiesProfile{
    
    self.layer.cornerRadius = self.layer.frame.size.width/2;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4].CGColor;
    self.layer.masksToBounds = NO;
    self.clipsToBounds = YES;
 
}

-(void)initWithAppPropertiesPlaceholderImage{
    
    self.clipsToBounds = YES;
    //self.image = kPlaceholderImage;
    self.contentMode = UIViewContentModeScaleAspectFill;
    //self.layer.cornerRadius = 3.0;
    
}

-(void)initWithAppPropertiesBottomPlaceholderImage{
    
    self.clipsToBounds = YES;
    self.image = kMainPlaceholderImage;
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.layer.cornerRadius = 3.0;
    
}

-(void)initWithAppPropertiesMapiconImage{
    
    self.layer.cornerRadius = self.layer.frame.size.width/2;
    self.layer.borderWidth = 2.0f;
    self.layer.borderColor = [UIColor orangeColor].CGColor;
    self.layer.masksToBounds = NO;
    self.clipsToBounds = YES;
    
}

@end
