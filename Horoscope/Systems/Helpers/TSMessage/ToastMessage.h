//
//  ToastMessage.h
//  CRTOAST
//
//  Created by Social  on 24/10/15.
//  Copyright (c) 2015 Social . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define ToastMessage_failed [UIColor colorWithRed:204.0/255 green:0 blue:0 alpha:1.0]
#define ToastMessage_alert [UIColor colorWithRed:1.0 green:136.0/255 blue:0 alpha:1.0]
#define ToastMessage_success [UIColor colorWithRed:102.0/255 green:153.0/255 blue:0 alpha:1.0]

#define TMT_failed @"Failed"
#define TMT_alert @"Alert"
#define TMT_success @"Success"
/*
#define ToastMessage_failed TSMessageNotificationTypeError
#define ToastMessage_alert TSMessageNotificationTypeWarning
#define ToastMessage_success TSMessageNotificationTypeSuccess
*/

// add image to app image and icon in general tab->app icon
//height use CRNavigationBarDefaultHeight in CRToastLayoutHelpers.h


@interface ToastMessage : NSObject
+(void)showMessageWithTitle:(NSString *)msgTitle Message:(NSString *)msgText BackgroundColor:(UIColor *)color withDuration:(float)duration;
+(void)displayMessageWithTitle:(NSString *)msgTitle Message:(NSString *)msgText BackgroundColor:(UIColor *)color withDuration:(float)duration;
+(NSDictionary *)mydict  :(NSString *)msgTitle :(NSString *)msgText :(UIColor *)color :(float)duration;
+(NSDictionary *)mydict  :(NSString *)msgTitle :(NSString *)msgText :(UIColor *)color :(float)duration :(BOOL)flag;
+(void)dismissMessage:(BOOL)flag;


+(void)displayToastWithMessage:(NSString *)msgText;

@end
