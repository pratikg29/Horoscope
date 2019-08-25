//
//  UINavigationController+MYTransition.m
//  Viva Campaign
//
//  Created by mac1 on 25/11/16.
//  Copyright © 2016 Social Infotech. All rights reserved.
//

#import "UIView+DViewTransition.h"


@implementation UIView(DViewTransition)


-(void)transition
{
    //Slow blur animation
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    
    [self.layer addAnimation:transition forKey:nil];
   
    
}

-(void)transitionDialogShow
{
    self.hidden = NO;
    self.alpha = 0;
    [UIView animateWithDuration:0.25 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^
     {
         self.alpha = 1;
     }
     completion:nil];
}

-(void)transitionDialogHide
{
   
   
         self.alpha = 0;
          self.hidden = YES;
    
}

- (void)transitionDialogShowAnimate
{
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.25 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)transitionDialogRemoveAnimate
{
    self.alpha = 1;
    self.transform = CGAffineTransformMakeScale(1, 1);
    
    [UIView animateWithDuration:.4 animations:^{
        self.transform = CGAffineTransformMakeScale(0.3, 0.3);
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}


@end
