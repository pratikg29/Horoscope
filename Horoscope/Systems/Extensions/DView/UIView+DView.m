//
//  UILabel+FontSizeFit.m
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import "UIView+DView.h"
#import "DUIFont.h"

@implementation UIView (DView)


-(void)initWithAppViewProperties
{
    //[self.layer setBackgroundColor: [[UIColor blackColor] CGColor]];
    [self.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [self.layer setBorderWidth: 0.2];
    [self.layer setCornerRadius:3.0f];
    [self.layer setMasksToBounds:NO];
    [self.layer setShadowRadius:2.0f];
    self.layer.shadowColor = [[UIColor grayColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.layer.shadowOpacity = 0.4f;
    self.layer.shadowRadius = 0.8f;
}

-(void)initWithAppDialogViewProperties
{
    [self.layer setMasksToBounds:NO];
    [self.layer setShadowRadius:2.0f];
    self.layer.shadowColor = [[UIColor grayColor] CGColor]; //[[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1.0] CGColor];
    self.layer.shadowOffset = CGSizeMake(0.2f, 0.8f);
    self.layer.shadowOpacity = 2.0f;
    self.layer.shadowRadius = 0.3f;
    
    self.layer.cornerRadius = 3.0;
    self.clipsToBounds = YES;
}


-(void)initWithAppDialogToastViewProperties
{
    [self.layer setMasksToBounds:NO];
    [self.layer setShadowRadius:2.0f];
    self.layer.shadowColor = [[UIColor grayColor] CGColor]; //[[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1.0] CGColor];
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.8f);
    self.layer.shadowOpacity = 2.0f;
    self.layer.shadowRadius = 0.3f;
    
    self.layer.cornerRadius = 5.0;
    self.clipsToBounds = YES;
    
    // Default color, depending on the current iOS version
    BOOL isLegacy = kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iOS_7_0;

    // Transparent background
    self.opaque = NO;
    self.backgroundColor = isLegacy ? [UIColor whiteColor] : [UIColor colorWithWhite:1.f alpha:0.7f];
    // Make it invisible for now
    self.alpha = 0.0f;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.layer.allowsGroupOpacity = NO;
    
    

}

-(void)initWithAppDialogBackgroundViewProperties
{
    
    [self.layer setMasksToBounds:NO];
    [self.layer setShadowRadius:2.0f];
    self.layer.shadowColor = [[UIColor grayColor] CGColor]; //[[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1.0] CGColor];
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.8f);
    self.layer.shadowOpacity = 2.0f;
    self.layer.shadowRadius = 0.3f;
    
    UIImageView *dot = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height)];
    dot.alpha = .85;
    [self addSubview:dot];
    
    
}

-(void)initWithAppHeaderProperties
{
    //[self.layer setBackgroundColor: [[UIColor blackColor] CGColor]];
    [self.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [self.layer setBorderWidth: 0.0];
    //[self.layer setCornerRadius:12.0f];
    [self.layer setMasksToBounds:NO];
    [self.layer setShadowRadius:4.0f];
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
    self.layer.shadowOpacity = 0.3f;
    self.layer.shadowRadius = 0.8f;
}

-(void)initWithAppCellProperties {
    
    [self.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [self.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [self.layer setBorderWidth: 0.0];
    [self.layer setCornerRadius:3.0f];
    [self.layer setMasksToBounds:NO];
    [self.layer setShadowRadius:4.0f];
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.layer.shadowOpacity = 0.2f;
    self.layer.shadowRadius = 0.8f;
    
    
}
-(void)initWithAppCellTopCornerProperties{
    
    
    /*UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.frame.origin.x, self.frame.origin.y, D_SCREEN_WIDTH, self.frame.size.height) byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, D_SCREEN_WIDTH, self.frame.size.height);
    maskLayer.path  = maskPath.CGPath;
    self.layer.mask = maskLayer;*/
    
    [self.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [self.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [self.layer setBorderWidth: 0.0];
    [self.layer setCornerRadius:2.0f];
    [self.layer setMasksToBounds:NO];
    [self.layer setShadowRadius:4.0f];
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.layer.shadowOpacity = 0.2f;
    self.layer.shadowRadius = 0.8f;
    
    
}


-(void)initWithAppCellWithoutCornerProperties {
    
    [self.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [self.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [self.layer setBorderWidth: 0.0];
    //[self.layer setCornerRadius:3.0f];
    [self.layer setMasksToBounds:NO];
    [self.layer setShadowRadius:4.0f];
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.layer.shadowOpacity = 0.2f;
    self.layer.shadowRadius = 0.8f;
    
    
}

-(void)initWithAppPropertiesRightAndBottomShadow
{
    self.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(2, 2);
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 1.0;
    self.layer.cornerRadius = 3.0f;
}

-(void)initWithAppPropertiesBackground
{
    /*CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[kDefaultLightBackgroundColor CGColor], (id)[kDefaultDarkBackgroundColor CGColor], nil];
    [self.layer insertSublayer:gradient atIndex:0];*/
    //use startPoint and endPoint to change direction of gradient (http://stackoverflow.com/a/20387923/2057171)
   
}

-(void)initWithAppPropertiesCircle
{
    self.layer.cornerRadius = self.layer.frame.size.width/2;
    //self.layer.borderWidth = 0.5f;
    //self.layer.borderColor = [UIColor colorWithWhite:0.7 alpha:1.0].CGColor;
    self.layer.masksToBounds = NO;
    self.clipsToBounds = YES;
}

-(void)initWithAppPropertiesTopbar
{
    [self.layer setBackgroundColor: [kDefaultThemeColorTopbar CGColor]];
}

-(void)initWithAppPropertiesHeader
{
    [self.layer setBackgroundColor: [kDefaultThemeColorHeader CGColor]];
}


-(void)initWithWhiteTransparent
{
    if (!UIAccessibilityIsReduceTransparencyEnabled()) {
        self.backgroundColor = [UIColor clearColor];
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.frame = self.bounds;
        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.layer.cornerRadius = 4.0;
        self.layer.masksToBounds = NO;
        self.clipsToBounds = YES;
        [self addSubview:blurEffectView];
         [self sendSubviewToBack: blurEffectView];
        blurEffectView.alpha = 0.5;
    } else {
        self.backgroundColor = [UIColor blackColor];
    }
    //[self.layer setBackgroundColor: [[UIColor colorWithWhite:0.5 alpha:1.0] CGColor]];
}


@end
