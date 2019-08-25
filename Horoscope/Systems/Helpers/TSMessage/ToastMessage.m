//
//  ToastMessage.m
//  CRTOAST
//
//  Created by   on 24/10/15.
//  Copyright (c) 2015  . All rights reserved.
//

#import "ToastMessage.h"
#import "TSMessage.h"
#import "UIView+Toast.h"

// add image to app image and icon in general tab->app icon

@implementation ToastMessage
+(void)showMessageWithTitle:(NSString *)msgTitle Message:(NSString *)msgText BackgroundColor:(UIColor *)color withDuration:(float)duration
{
    if ([color isEqual:ToastMessage_success]) {
        [TSMessage showNotificationWithTitle:msgText type:TSMessageNotificationTypeSuccess];
    }

    else if ([color isEqual:ToastMessage_alert]) {
        [TSMessage showNotificationWithTitle:msgText type:TSMessageNotificationTypeWarning];
    }

    else if ([color isEqual:ToastMessage_failed]) {
        [TSMessage showNotificationWithTitle:msgText type:TSMessageNotificationTypeError];
    }
    /*[CRToastManager dismissNotification:YES];
    [CRToastManager showNotificationWithOptions:[self mydict:msgTitle :msgText :color :duration]
                                 apperanceBlock:^(void) {
                                     NSLog(@"Appeared");
                                 }
                                completionBlock:^(void) {
                                    NSLog(@"Completed");
                                }];*/
}
+(void)displayMessageWithTitle:(NSString *)msgTitle Message:(NSString *)msgText BackgroundColor:(UIColor *)color withDuration:(float)duration
{
    if ([color isEqual:ToastMessage_success]) {
        [TSMessage showNotificationWithTitle:msgText type:TSMessageNotificationTypeSuccess];
    }
    
    else if ([color isEqual:ToastMessage_alert]) {
        [TSMessage showNotificationWithTitle:msgText type:TSMessageNotificationTypeWarning];
    }
    
    else if ([color isEqual:ToastMessage_failed]) {
        [TSMessage showNotificationWithTitle:msgText type:TSMessageNotificationTypeError];
    }
    /*[CRToastManager dismissNotification:YES];
    [CRToastManager showNotificationWithOptions:[self mydict:msgTitle :msgText :color :duration :YES]
                                 apperanceBlock:^(void) {
                                     NSLog(@"Appeared");
                                 }
                                completionBlock:^(void) {
                                    NSLog(@"Completed");
                                }];*/
}

+(void)dismissMessage:(BOOL)flag
{
    //[CRToastManager dismissNotification:flag];
}


+(NSDictionary *)mydict  :(NSString *)msgTitle :(NSString *)msgText :(UIColor *)color :(float)duration
{

    NSMutableDictionary *options = [[NSMutableDictionary alloc]init];
    
   /* if (color==nil) {
        color = [UIColor orangeColor];
    }
    
    if (duration==0) {
        duration =2.0;
    }
    
    if (msgTitle==nil && msgText==nil && color==nil) {
        options = [@{kCRToastNotificationTypeKey               :@(CRToastTypeNavigationBar),
                     
                     
                     
                     kCRToastNotificationPresentationTypeKey   : @(CRToastPresentationTypeCover),
                     
                     
                     kCRToastUnderStatusBarKey                 : @(NO),
                     
                     kCRToastTimeIntervalKey                   : @(duration),
                     kCRToastAnimationInDirectionKey           : @(2),
                     kCRToastAnimationOutDirectionKey          : @(2),
                     kCRToastImageKey                          : [UIImage imageNamed:@"alert_icon"],
                     kCRToastImageAlignmentKey                 : @(NSTextAlignmentLeft),
                     kCRToastImageKey                          : @(2),
                     
                     kCRToastNotificationPreferredPaddingKey   : @(1.0),
                     kCRToastNotificationTypeKey               : @(CRToastTypeNavigationBar),
                     kCRToastFontKey                           : [UIFont fontWithName:@"HelveticaNeue-Medium" size:15],
                     kCRToastSubtitleFontKey                   : [UIFont fontWithName:@"HelveticaNeue-Medium" size:12],
                     kCRToastTextColorKey                      : [UIColor whiteColor],
                     kCRToastBackgroundColorKey                : [UIColor orangeColor],
                     kCRToastInteractionRespondersKey          : @[[CRToastInteractionResponder interactionResponderWithInteractionType:CRToastInteractionTypeTap
                                                                                                                   automaticallyDismiss:YES
                                                                                                                                  block:^(CRToastInteractionType interactionType){
                                                                                                                                      NSLog(@"Dismissed with %@ interaction", NSStringFromCRToastInteractionType(interactionType));
                                                                                                                                  }]],
                     kCRToastAutorotateKey                     : @(YES)} mutableCopy];
    }
    else if (msgTitle==nil && msgText==nil) {
        options = [@{kCRToastNotificationTypeKey               :@(CRToastTypeNavigationBar),
                     
                     
                     
                     kCRToastNotificationPresentationTypeKey   : @(CRToastPresentationTypeCover),
                     
                     
                     kCRToastUnderStatusBarKey                 : @(NO),
                     
                     
                     kCRToastTimeIntervalKey                   : @(duration),
                     kCRToastAnimationInDirectionKey           : @(2),
                     kCRToastAnimationOutDirectionKey          : @(2),
                     kCRToastImageKey                          : [UIImage imageNamed:@"alert_icon"],
                     kCRToastImageAlignmentKey                 : @(NSTextAlignmentLeft),
                     kCRToastImageKey                          : @(2),
                     
                     kCRToastNotificationPreferredPaddingKey   : @(1.0),
                     kCRToastNotificationTypeKey               : @(CRToastTypeNavigationBar),
                     kCRToastFontKey                           : [UIFont fontWithName:@"HelveticaNeue-Medium" size:15],
                     kCRToastSubtitleFontKey                   : [UIFont fontWithName:@"HelveticaNeue-Medium" size:12],
                     kCRToastTextColorKey                      : [UIColor whiteColor],
                     kCRToastBackgroundColorKey                : color,
                     kCRToastInteractionRespondersKey          : @[[CRToastInteractionResponder interactionResponderWithInteractionType:CRToastInteractionTypeTap
                                                                                                                   automaticallyDismiss:YES
                                                                                                                                  block:^(CRToastInteractionType interactionType){
                                                                                                                                      NSLog(@"Dismissed with %@ interaction", NSStringFromCRToastInteractionType(interactionType));
                                                                                                                                  }]],
                     kCRToastAutorotateKey                     : @(YES)} mutableCopy];

    }
    else if (msgTitle==nil) {
        options = [@{kCRToastNotificationTypeKey               :@(CRToastTypeNavigationBar),
                     
                     
                     
                     kCRToastNotificationPresentationTypeKey   : @(CRToastPresentationTypeCover),
                     
                     
                     kCRToastUnderStatusBarKey                 : @(NO),
                     
                     
                     kCRToastTextKey                           : msgText,
                     kCRToastTextAlignmentKey                  : @(NSTextAlignmentLeft),
                     
                     kCRToastTimeIntervalKey                   : @(duration),
                     kCRToastAnimationInDirectionKey           : @(2),
                     kCRToastAnimationOutDirectionKey          : @(2),
                     kCRToastImageKey                          : [UIImage imageNamed:@"alert_icon"],
                     kCRToastImageAlignmentKey                 : @(NSTextAlignmentLeft),
                     kCRToastImageKey                          : @(2),
                     
                     kCRToastNotificationPreferredPaddingKey   : @(1.0),
                     kCRToastNotificationTypeKey               : @(CRToastTypeNavigationBar),
                     kCRToastFontKey                           : [UIFont fontWithName:@"HelveticaNeue-Medium" size:15],
                     kCRToastSubtitleFontKey                   : [UIFont fontWithName:@"HelveticaNeue-Medium" size:12],
                     kCRToastTextColorKey                      : [UIColor whiteColor],
                     kCRToastBackgroundColorKey                : color,
                     kCRToastInteractionRespondersKey          : @[[CRToastInteractionResponder interactionResponderWithInteractionType:CRToastInteractionTypeTap
                                                                                                                   automaticallyDismiss:YES
                                                                                                                                  block:^(CRToastInteractionType interactionType){
                                                                                                                                      NSLog(@"Dismissed with %@ interaction", NSStringFromCRToastInteractionType(interactionType));
                                                                                                                                  }]],
                     kCRToastAutorotateKey                     : @(YES)} mutableCopy];
    }
    else if(msgText==nil)
    {
        options = [@{kCRToastNotificationTypeKey               :@(CRToastTypeNavigationBar),
                     
                     
                     
                     kCRToastNotificationPresentationTypeKey   : @(CRToastPresentationTypeCover),
                     
                     
                     kCRToastUnderStatusBarKey                 : @(NO),
                     
                     kCRToastSubtitleTextKey                   : msgTitle,
                     kCRToastSubtitleTextAlignmentKey          : @(NSTextAlignmentLeft),
                     
                     kCRToastTimeIntervalKey                   : @(duration),
                     kCRToastAnimationInDirectionKey           : @(2),
                     kCRToastAnimationOutDirectionKey          : @(2),
                     kCRToastImageKey                          : [UIImage imageNamed:@"alert_icon"],
                     kCRToastImageAlignmentKey                 : @(NSTextAlignmentLeft),
                     kCRToastImageKey                          : @(2),
                     
                     kCRToastNotificationPreferredPaddingKey   : @(1.0),
                     kCRToastNotificationTypeKey               : @(CRToastTypeNavigationBar),
                     kCRToastFontKey                           : [UIFont fontWithName:@"HelveticaNeue-Medium" size:15],
                     kCRToastSubtitleFontKey                   : [UIFont fontWithName:@"HelveticaNeue-Medium" size:12],
                     kCRToastTextColorKey                      : [UIColor whiteColor],
                     kCRToastBackgroundColorKey                : color,
                     kCRToastInteractionRespondersKey          : @[[CRToastInteractionResponder interactionResponderWithInteractionType:CRToastInteractionTypeTap
                                                                                                                   automaticallyDismiss:YES
                                                                                                                                  block:^(CRToastInteractionType interactionType){
                                                                                                                                      NSLog(@"Dismissed with %@ interaction", NSStringFromCRToastInteractionType(interactionType));
                                                                                                                                  }]],
                     kCRToastAutorotateKey                     : @(YES)} mutableCopy];
    }
    else{
        options = [@{kCRToastNotificationTypeKey               :@(CRToastTypeNavigationBar),
                     
                     
                     
                     kCRToastNotificationPresentationTypeKey   : @(CRToastPresentationTypeCover),
                     
                     
                     kCRToastUnderStatusBarKey                 : @(NO),
                     
                     kCRToastSubtitleTextKey                   : msgTitle,
                     kCRToastSubtitleTextAlignmentKey          : @(NSTextAlignmentLeft),
                     
                     kCRToastTextKey                           : msgText,
                     kCRToastTextAlignmentKey                  : @(NSTextAlignmentLeft),
                     
                     kCRToastTimeIntervalKey                   : @(duration),
                     kCRToastAnimationInDirectionKey           : @(2),
                     kCRToastAnimationOutDirectionKey          : @(2),
                     kCRToastImageKey                          : [UIImage imageNamed:@"alert_icon"],
                     kCRToastImageAlignmentKey                 : @(NSTextAlignmentLeft),
                     kCRToastImageKey                          : @(2),
                     
                     kCRToastNotificationPreferredPaddingKey   : @(1.0),
                     kCRToastNotificationTypeKey               : @(CRToastTypeNavigationBar),
                     kCRToastFontKey                           : [UIFont fontWithName:@"HelveticaNeue-Medium" size:15],
                     kCRToastSubtitleFontKey                   : [UIFont fontWithName:@"HelveticaNeue-Medium" size:12],
                     kCRToastTextColorKey                      : [UIColor whiteColor],
                     kCRToastBackgroundColorKey                : color,
                     kCRToastInteractionRespondersKey          : @[[CRToastInteractionResponder interactionResponderWithInteractionType:CRToastInteractionTypeTap
                                                                                                                   automaticallyDismiss:YES
                                                                                                                                  block:^(CRToastInteractionType interactionType){
                                                                                                                                      NSLog(@"Dismissed with %@ interaction", NSStringFromCRToastInteractionType(interactionType));
                                                                                                                                  }]],
                     kCRToastAutorotateKey                     : @(YES)} mutableCopy];

    }*/
    
    return [NSDictionary dictionaryWithDictionary:options];
}

+(NSDictionary *)mydict  :(NSString *)msgTitle :(NSString *)msgText :(UIColor *)color :(float)duration :(BOOL)flag
{
    NSMutableDictionary *options = [[NSMutableDictionary alloc]init];
    /*options = [@{kCRToastNotificationTypeKey               :@(CRToastTypeNavigationBar),
                 
                 
                 
                 kCRToastNotificationPresentationTypeKey   : @(CRToastPresentationTypeCover),
                 
                 
                 kCRToastUnderStatusBarKey                 : @(NO),
                 
                 kCRToastSubtitleTextKey                   : msgTitle,
                 kCRToastSubtitleTextAlignmentKey          : @(NSTextAlignmentLeft),
                 
                 kCRToastTextKey                           : msgText,
                 kCRToastTextAlignmentKey                  : @(NSTextAlignmentLeft),
                 
                 kCRToastTimeIntervalKey                   : @(duration),
                 kCRToastAnimationInDirectionKey           : @(2),
                 kCRToastAnimationOutDirectionKey          : @(2),
                 kCRToastImageKey                          : [UIImage imageNamed:@"alert_icon"],
                 kCRToastImageAlignmentKey                 : @(NSTextAlignmentLeft),
                 kCRToastImageKey                          : @(2),
                 
                 kCRToastNotificationPreferredPaddingKey   : @(1.0),
                 kCRToastNotificationTypeKey               : @(CRToastTypeNavigationBar),
                 kCRToastFontKey                           : [UIFont fontWithName:@"HelveticaNeue-Medium" size:15],
                 kCRToastSubtitleFontKey                   : [UIFont fontWithName:@"HelveticaNeue-Medium" size:12],
                 kCRToastTextColorKey                      : [UIColor whiteColor],
                 kCRToastBackgroundColorKey                : color,
                 kCRToastForceUserInteractionKey           : @YES,
                 kCRToastInteractionRespondersKey          : @[[CRToastInteractionResponder interactionResponderWithInteractionType:CRToastInteractionTypeTap
                                                                                                               automaticallyDismiss:YES
                                                                                                                              block:^(CRToastInteractionType interactionType){
                                                                                                                                  NSLog(@"Dismissed with %@ interaction", NSStringFromCRToastInteractionType(interactionType));
                                                                                                                              }]],
                 kCRToastAutorotateKey                     : @(YES)} mutableCopy];*/
     return [NSDictionary dictionaryWithDictionary:options];
    
}



+(void)displayToastWithMessage:(NSString *)msgText
{
    
    [[TSMessage defaultViewController].view hideToasts];
    [[TSMessage defaultViewController].view makeToast:msgText];
}


@end
