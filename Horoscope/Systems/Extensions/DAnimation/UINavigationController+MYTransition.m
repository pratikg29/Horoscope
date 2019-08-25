//
//  UINavigationController+MYTransition.m
//  Viva Campaign
//
//  Created by mac1 on 25/11/16.
//  Copyright © 2016 Social Infotech. All rights reserved.
//

#import "UINavigationController+MYTransition.h"


@implementation UINavigationController(MYTransition)


-(void)transition
{
    //Slow blur animation
    CATransition* transition = [CATransition animation];
    transition.duration = 0.4;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    
    [self.view.layer addAnimation:transition forKey:nil];
   
    
    
    //Moving all side
    /*
    // create a CGPath that implements two arcs (a bounce)
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,74.0,74.0);
    CGPathAddCurveToPoint(thePath,NULL,74.0,500.0,
                          320.0,500.0,
                          320.0,74.0);
    CGPathAddCurveToPoint(thePath,NULL,320.0,500.0,
                          566.0,500.0,
                          566.0,74.0);
    
    CAKeyframeAnimation * theAnimation;
    
    // Create the animation object, specifying the position property as the key path.
    theAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimation.path=thePath;
    theAnimation.duration=5.0;
    
    // Add the animation to the layer.
    [self.view.layer addAnimation:theAnimation forKey:@"position"];
     */
    
    //Animating Multiple Changes Together
    /*// Animation 1
    CAKeyframeAnimation* widthAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
    NSArray* widthValues = [NSArray arrayWithObjects:@1.0, @10.0, @5.0, @30.0, @0.5, @15.0, @2.0, @50.0, @0.0, nil];
    widthAnim.values = widthValues;
    widthAnim.calculationMode = kCAAnimationPaced;
    
    // Animation 2
    CAKeyframeAnimation* colorAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderColor"];
    NSArray* colorValues = [NSArray arrayWithObjects:(id)[UIColor lightGrayColor].CGColor,
                            (id)[UIColor darkGrayColor].CGColor, (id)[UIColor lightGrayColor].CGColor,  nil];
    colorAnim.values = colorValues;
    colorAnim.calculationMode = kCAAnimationPaced;
    
    // Animation group
    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:colorAnim, widthAnim, nil];
    group.duration = 5.0;
    
    [self.view.layer addAnimation:group forKey:@"BorderChanges"];*/
    
    
    //Sliding positions
    /*
    self.view.layer.opacity = 0.0;
    [UIView animateWithDuration:0.6 animations:^{
        // Change the opacity implicitly.
        self.view.layer.opacity = 1.0;
        CGPoint point = CGPointMake(self.view.layer.frame.size.width/2, self.view.layer.frame.size.height);
        // Change the position explicitly.
        CABasicAnimation* theAnim = [CABasicAnimation animationWithKeyPath:@"position"];
        theAnim.fromValue = [NSValue valueWithCGPoint:point];
        theAnim.toValue = [NSValue valueWithCGPoint:self.view.layer.position];
        theAnim.duration = 0.2;
        [self.view.layer addAnimation:theAnim forKey:@"position"];
    }];
     */
    
    /*CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @77;
    animation.toValue = @455;
    animation.duration = 1;
    
    [self.view.layer addAnimation:animation forKey:@"basic"];
    
    self.view.layer.position = CGPointMake(455, 61);*/
    
    /*CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @77;
    animation.toValue = @455;
    animation.duration = 1;
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [self.view.layer addAnimation:animation forKey:@"basic"];*/
}



- (void)animateTransition
{
    id<UIViewControllerContextTransitioning> transitionContext;
    UIViewController* toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView* container = [transitionContext containerView];
    
    //get rects that represent the top and bottom halves of the screen
    CGSize viewSize = fromController.view.bounds.size;
    CGRect topFrame = CGRectMake(0, 0, viewSize.width, viewSize.height/2);
    CGRect bottomFrame = CGRectMake(0, viewSize.height/2, viewSize.width, viewSize.height/2);
    
    //create snapshots
    UIView* snapshot = [toController.view snapshotViewAfterScreenUpdates:YES];
    UIView* snapshotTop = [snapshot resizableSnapshotViewFromRect:topFrame afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
    UIView* snapshotBottom = [snapshot resizableSnapshotViewFromRect:bottomFrame afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
    
    //start the frames with an offset
    CGRect offsetTopFrame = topFrame;
    CGRect offsetBottomFrame = bottomFrame;
    offsetTopFrame.origin.y -= topFrame.size.height;
    offsetBottomFrame.origin.y += bottomFrame.size.height;
    snapshotTop.frame = offsetTopFrame;
    snapshotBottom.frame = offsetBottomFrame;
    
    //add our snapshots on top
    [container addSubview:snapshotTop];
    [container addSubview:snapshotBottom];
    
    [UIView animateKeyframesWithDuration:0.35 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        //animate the top first
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            snapshotTop.frame = topFrame;
        }];
        
        //animate the bottom second
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            snapshotBottom.frame = bottomFrame;
        }];
        
    } completion:^(BOOL finished) {
        
        //don't forget to clean up
        [snapshotTop removeFromSuperview];
        [snapshotBottom removeFromSuperview];
        [fromController.view removeFromSuperview];
        [container addSubview:toController.view];
        
        //put the original stuff back in place if the user cancelled
        if(transitionContext.transitionWasCancelled)
        {
            [toController.view removeFromSuperview];
            [container addSubview:fromController.view];
        }
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}



@end
