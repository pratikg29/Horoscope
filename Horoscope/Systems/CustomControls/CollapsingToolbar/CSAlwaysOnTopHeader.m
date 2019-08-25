//
//  CSAlwaysOnTopHeader.m
//  CSStickyHeaderFlowLayoutDemo
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//


#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "init.h"



//#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



@implementation CSAlwaysOnTopHeader

- (void)applyLayoutAttributes:(CSStickyHeaderFlowLayoutAttributes *)layoutAttributes {
    
    [self animationNEW:layoutAttributes];
    [self initKit];
    [self initSlider];
}

-(void)initKit
{
    self.slideshow.backgroundColor = kDefaultThemeColorTopbar;
    self.Imgheight =self.imgCoverPhoto.layer.frame.size.height;
    //[self.view_header initWithAppPropertiesHeader];
    //[self.view_topbar initWithAppPropertiesTopbar];
    [self.titleLabel initWithAppPropertiesColorWhite];
    [self.titleLabel initWithAppPropertiesSize:kDefaultFontSizeExtraLarge Type:DFONTMEDIUM];
    [self.subtitleView initWithAppPropertiesTopbar];
    
    [self.titleLabel_2 initWithAppPropertiesColorWhite];
    [self.titleLabel_2 initWithAppPropertiesSize:kDefaultFontSizeExtraLarge32 Type:DFONTMEDIUM];
    [self.subtitleTextView initWithAppPropertiesColorWhite];
    [self.subtitleTextView initWithAppPropertiesSize:kDefaultFontSizeMedium Type:DFONTREGULAR];
    
    //self.imgCoverPhoto.contentMode = UIViewContentModeScaleAspectFill;
}

-(void)animationNEW:(CSStickyHeaderFlowLayoutAttributes *)layoutAttributes
{
    [UIView beginAnimations:@"" context:nil];
    
    self.backgroundColor = kDefaultThemeColorTopbar;
    
    float height = (1-layoutAttributes.progressiveness);
    
    
    if (0.7 <= height) {
        self.viewHeader.alpha =  1;
        
    }
    else if (0.3 <= height && height < 0.5) {
        
        float points = 1 - (((0.5 - height)/2)*10);
        self.viewHeader.alpha =  points;
        NSLog(@"%f---=%f",points,height);
        
        if (points>0.3) {
            self.titleLabel_2.alpha = 0;
        }
        else
        {
            self.titleLabel_2.alpha = 1;
        }
    }
    else if (0.1 <= height && height < 0.3) {
        
        
       
    }
    else if(height < 0.3){
        
        self.titleLabel_2.alpha = 1;
        [UIView animateWithDuration:1.5 animations:^{
            //self.titleLabel.alpha = 0;
            self.viewHeader.alpha =  0;
        }];
        self.imgCoverPhoto.alpha = 1;
        
    }
    
    [UIView commitAnimations];
}

-(void)animationOLD:(CSStickyHeaderFlowLayoutAttributes *)layoutAttributes
{
    [UIView beginAnimations:@"" context:nil];
    
    self.backgroundColor = kDefaultThemeColorTopbar;
    
    float height = (1-layoutAttributes.progressiveness);
    /*if (self.Imgheight!=0) {
     float tmpH = self.Imgheight/10;
     self.imgCoverPhoto.frame = CGRectMake(self.imgCoverPhoto.frame.origin.x, self.imgCoverPhoto.frame.origin.y, self.imgCoverPhoto.frame.size.width, tmpH*height);
     }*/
    
    
    if (0.7 <= height) {
        
        
        //self.viewHeader.alpha =  1;
        
    }
    else if (0.5 <= height && height < 0.7) {
        
        
        float points = 1 - (((0.7 - height)/2)*10);
        self.viewHeader.alpha =  points;
        NSLog(@"%f---=%f",points,height);
        
        //self.imgCoverPhoto.alpha = 0;
        
        /*[UIView animateWithDuration:1.5 animations:^{
         //self.titleLabel.alpha = 1;
         float points = 1 - (((0.5 - height)/2)*10);
         NSLog(@"%f---=%f",points,height);
         self.imgCoverPhoto.alpha = 0;
         self.viewHeader.alpha =  1;
         }];*/
    } else {
        self.titleLabel_2.alpha = 1;
        [UIView animateWithDuration:1.5 animations:^{
            //self.titleLabel.alpha = 0;
            self.viewHeader.alpha =  0;
        }];
        self.imgCoverPhoto.alpha = 1;
    }
    NSLog(@"%f",height);
    //NSLog(@"%f---=%f",layoutAttributes.progressiveness,height);
    
    if (0.2 <= height && height < 0.4) {
        
        
        //NSLog(@"%f -- %f",height,points);
        
        [UIView animateWithDuration:0.3 animations:^{
            
            //self.viewMainContent.alpha = 1 - points;
        }];
    }
    if (height >= 0.4) {
        //self.viewHeader.alpha =  1;
        //self.viewMainContent.alpha = 0;
    }
    else if(height < 0.3){
        
        [UIView animateWithDuration:0.3 animations:^{
            //self.viewHeader.alpha = 0;
            
        }];
        
        //self.viewMainContent.alpha = 1;
        
    }
    
    [UIView commitAnimations];
}

-(void)initSlider
{
    
    [self.pageController setUserInteractionEnabled:NO];
    
    // KASlideshow
    _slideshow.datasource = self;
    _slideshow.delegate = self;
    //[_slideshow setDelay:1]; // Delay between transitions
    [_slideshow setTransitionDuration:.5]; // Transition duration
    [_slideshow setTransitionType:KASlideShowTransitionSlideHorizontal]; // Choose a transition type (fade or slide)
    [_slideshow setImagesContentMode:UIViewContentModeScaleAspectFill]; // Choose a content mode for images to display
    [_slideshow addGesture:KASlideShowGestureSwipe]; // Gesture to go previous/next directly on the image
   

}

-(void)fillDataInSlideShow:(NSArray *)array
{
    _datasource = [array mutableCopy];
    [_slideshow reloadData];
    [_slideshow start];
}

#pragma mark - KASlideShow datasource

- (NSObject *)slideShow:(KASlideShow *)slideShow objectAtIndex:(NSUInteger)index
{
    return _datasource[index];
}

- (NSUInteger)slideShowImagesNumber:(KASlideShow *)slideShow
{
    self.pageController.numberOfPages = _datasource.count;
    NSLog(@"%lu",(unsigned long)slideShow.currentIndex);
    self.pageController.currentPage = slideShow.currentIndex;
    return _datasource.count;
    
}
#pragma mark - KASlideShow delegate

- (void) slideShowDidSwipeLeft:(KASlideShow *) slideShow
{
    NSLog(@"slideShowWillShowNext, index : %@",@(slideShow.currentIndex));
    self.pageController.currentPage = slideShow.currentIndex;
}
- (void) slideShowDidSwipeRight:(KASlideShow *) slideShow
{
    NSLog(@"slideShowWillShowNext, index : %@",@(slideShow.currentIndex));
    self.pageController.currentPage = slideShow.currentIndex;
}

- (void) slideShowWillShowNext:(KASlideShow *)slideShow
{
    NSLog(@"slideShowWillShowNext, index : %@",@(slideShow.currentIndex));
    self.pageController.currentPage = slideShow.currentIndex;
}

- (void) slideShowWillShowPrevious:(KASlideShow *)slideShow
{
    NSLog(@"slideShowWillShowPrevious, index : %@",@(slideShow.currentIndex));
    self.pageController.currentPage = slideShow.currentIndex;
}




@end
