//
//  ViewController.h
//  ChatDemoByD
//
//  Created by mac1 on 25/03/17.
//  Copyright © 2017 Socialinfotech. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol UIPlaceHolderTextViewDelegate <NSObject>
@optional
- (void)UIPlaceHolderTextViewTextView:(NSString *)text;
- (void)UIPlaceHolderTextViewTextViewNew:(NSString *)text;
@end



IB_DESIGNABLE
@interface UIPlaceHolderTextView : UITextView<UITextViewDelegate>

@property(nonatomic, weak) id<UIPlaceHolderTextViewDelegate> delegatePlaceholder;

@property (nonatomic, retain) IBInspectable NSString *placeholder;
@property (nonatomic, retain) IBInspectable UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end
