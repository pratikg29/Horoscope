//
//  UILabel+FontSizeFit.m
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import "LGPlusButtonsView+DFloatButton.h"
#import "DUIFont.h"

@implementation LGPlusButtonsView (DFloatButton)


-(void)initWithAppPropertiesFloating :(UIImage *)img{
    
    
    
    //_plusButtonsViewMain.observedScrollView = self.scrollView;
    self.coverColor = [UIColor colorWithWhite:1.f alpha:0.7];
    self.position = LGPlusButtonsViewPositionRightBottom;
    self.plusButtonAnimationType = LGPlusButtonsAppearingAnimationTypeNone;
    
    [self setButtonsTitles:@[@""] forState:UIControlStateNormal];
    [self setDescriptionsTexts:@[@""]];
    [self setButtonsImages:@[img]
                  forState:UIControlStateNormal
            forOrientation:LGPlusButtonsViewOrientationAll];
    
    
    
    /**********************    Main Floating Button Properties ****************************/
    
    
    [self setButtonsAdjustsImageWhenHighlighted:NO];
    [self setButtonsBackgroundColor:kDefaultThemeColorTopbar forState:UIControlStateNormal];
    //[self setButtonsBackgroundColor:[UIColor colorWithRed:0.2 green:0.6 blue:1.f alpha:1.f] forState:UIControlStateHighlighted];
    [self setButtonsBackgroundColor:kDefaultThemeColorTopbar forState:UIControlStateHighlighted|UIControlStateSelected];
    [self setButtonsSize:CGSizeMake(44.f, 44.f) forOrientation:LGPlusButtonsViewOrientationAll];
    [self setButtonsLayerCornerRadius:44.f/2.f forOrientation:LGPlusButtonsViewOrientationAll];
    [self setButtonsTitleFont:[UIFont boldSystemFontOfSize:24.f] forOrientation:LGPlusButtonsViewOrientationAll];
    [self setButtonsLayerShadowColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.f]];
    [self setButtonsLayerShadowOpacity:0.5];
    [self setButtonsLayerShadowRadius:3.f];
    [self setButtonsLayerShadowOffset:CGSizeMake(0.f, 2.f)];
    [self setButtonAtIndex:0 size:CGSizeMake(56.f, 56.f)
            forOrientation:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? LGPlusButtonsViewOrientationPortrait : LGPlusButtonsViewOrientationAll)];
    [self setButtonAtIndex:0 layerCornerRadius:56.f/2.f
            forOrientation:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? LGPlusButtonsViewOrientationPortrait : LGPlusButtonsViewOrientationAll)];
    [self setButtonAtIndex:0 titleFont:[UIFont systemFontOfSize:40.f]
            forOrientation:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? LGPlusButtonsViewOrientationPortrait : LGPlusButtonsViewOrientationAll)];
    [self setButtonAtIndex:0 titleOffset:CGPointMake(0.f, -3.f) forOrientation:LGPlusButtonsViewOrientationAll];
    
    /**********************    Other Floating Button Properties ****************************/
    
    [self setDescriptionsBackgroundColor:[UIColor whiteColor]];
    [self setDescriptionsTextColor:[UIColor blackColor]];
    [self setDescriptionsLayerShadowColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.f]];
    [self setDescriptionsLayerShadowOpacity:0.25];
    [self setDescriptionsLayerShadowRadius:1.f];
    [self setDescriptionsLayerShadowOffset:CGSizeMake(0.f, 1.f)];
    [self setDescriptionsLayerCornerRadius:6.f forOrientation:LGPlusButtonsViewOrientationAll];
    [self setDescriptionsContentEdgeInsets:UIEdgeInsetsMake(4.f, 8.f, 4.f, 8.f) forOrientation:LGPlusButtonsViewOrientationAll];
    
    //for (NSUInteger i=1; i<=1; i++)
    [self setButtonAtIndex:0 offset:CGPointMake(-6.f, 0.f)
            forOrientation:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? LGPlusButtonsViewOrientationPortrait : LGPlusButtonsViewOrientationAll)];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        [self setButtonAtIndex:0 titleOffset:CGPointMake(0.f, -2.f) forOrientation:LGPlusButtonsViewOrientationLandscape];
        [self setButtonAtIndex:0 titleFont:[UIFont systemFontOfSize:32.f] forOrientation:LGPlusButtonsViewOrientationLandscape];
    }
    
    
    
}

-(void)initWithAppPropertiesFloatingBlank{
    
    
    
    //_plusButtonsViewMain.observedScrollView = self.scrollView;
    self.coverColor = [UIColor colorWithWhite:1.f alpha:0.7];
    self.position = LGPlusButtonsViewPositionRightBottom;
    self.plusButtonAnimationType = LGPlusButtonsAppearingAnimationTypeCrossDissolveAndPop;
    
    [self setButtonsTitles:@[] forState:UIControlStateNormal];
    [self setDescriptionsTexts:@[]];
    [self setButtonsImages:@[]
                  forState:UIControlStateNormal
            forOrientation:LGPlusButtonsViewOrientationAll];
    
    
    
    /**********************    Main Floating Button Properties ****************************/
    
    
    [self setButtonsAdjustsImageWhenHighlighted:NO];
    [self setButtonsBackgroundColor:kDefaultThemeColorHeader forState:UIControlStateNormal];
    //[self setButtonsBackgroundColor:[UIColor colorWithRed:0.2 green:0.6 blue:1.f alpha:1.f] forState:UIControlStateHighlighted];
    [self setButtonsBackgroundColor:kDefaultThemeColorHeader forState:UIControlStateHighlighted|UIControlStateSelected];
    [self setButtonsSize:CGSizeMake(44.f, 44.f) forOrientation:LGPlusButtonsViewOrientationAll];
    [self setButtonsLayerCornerRadius:44.f/2.f forOrientation:LGPlusButtonsViewOrientationAll];
    [self setButtonsTitleFont:[UIFont boldSystemFontOfSize:24.f] forOrientation:LGPlusButtonsViewOrientationAll];
    [self setButtonsLayerShadowColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.f]];
    [self setButtonsLayerShadowOpacity:0.5];
    [self setButtonsLayerShadowRadius:3.f];
    [self setButtonsLayerShadowOffset:CGSizeMake(0.f, 2.f)];
    [self setButtonAtIndex:0 size:CGSizeMake(56.f, 56.f)
            forOrientation:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? LGPlusButtonsViewOrientationPortrait : LGPlusButtonsViewOrientationAll)];
    [self setButtonAtIndex:0 layerCornerRadius:56.f/2.f
            forOrientation:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? LGPlusButtonsViewOrientationPortrait : LGPlusButtonsViewOrientationAll)];
    [self setButtonAtIndex:0 titleFont:[UIFont systemFontOfSize:40.f]
            forOrientation:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? LGPlusButtonsViewOrientationPortrait : LGPlusButtonsViewOrientationAll)];
    [self setButtonAtIndex:0 titleOffset:CGPointMake(0.f, -3.f) forOrientation:LGPlusButtonsViewOrientationAll];
    
    
    /**********************    Other Floating Button Properties ****************************/
    
    [self setDescriptionsBackgroundColor:[UIColor whiteColor]];
    [self setDescriptionsTextColor:[UIColor blackColor]];
    [self setDescriptionsLayerShadowColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.f]];
    [self setDescriptionsLayerShadowOpacity:0.25];
    [self setDescriptionsLayerShadowRadius:1.f];
    [self setDescriptionsLayerShadowOffset:CGSizeMake(0.f, 1.f)];
    [self setDescriptionsLayerCornerRadius:6.f forOrientation:LGPlusButtonsViewOrientationAll];
    [self setDescriptionsContentEdgeInsets:UIEdgeInsetsMake(4.f, 8.f, 4.f, 8.f) forOrientation:LGPlusButtonsViewOrientationAll];
    
    for (NSUInteger i=1; i<=3; i++)
        [self setButtonAtIndex:i offset:CGPointMake(-6.f, 0.f)
                forOrientation:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? LGPlusButtonsViewOrientationPortrait : LGPlusButtonsViewOrientationAll)];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        [self setButtonAtIndex:0 titleOffset:CGPointMake(0.f, -2.f) forOrientation:LGPlusButtonsViewOrientationLandscape];
        [self setButtonAtIndex:0 titleFont:[UIFont systemFontOfSize:32.f] forOrientation:LGPlusButtonsViewOrientationLandscape];
    }
    
    
    
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


@end

