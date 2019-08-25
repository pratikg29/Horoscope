//
//  UINavigationController+MYTransition.h
//  Viva Campaign
//
//  Created by mac1 on 25/11/16.
//  Copyright © 2016 Social Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(DViewTransition)
-(void)transition;
-(void)transitionDialogShow;
-(void)transitionDialogHide;
- (void)transitionDialogShowAnimate;
- (void)transitionDialogRemoveAnimate;
@end
