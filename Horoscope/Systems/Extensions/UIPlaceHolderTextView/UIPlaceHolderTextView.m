//
//  ViewController.m
//  ChatDemoByD
//
//  Created by mac1 on 25/03/17.
//  Copyright © 2017 Socialinfotech. All rights reserved.
//
#import "UIPlaceHolderTextView.h"

@interface UIPlaceHolderTextView ()

@property (nonatomic, retain) UILabel *placeHolderLabel;

@end

@implementation UIPlaceHolderTextView

CGFloat const UI_PLACEHOLDER_TEXT_CHANGED_ANIMATION_DURATION = 0.25;


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.delegate = self;
    
    
    // Use Interface Builder User Defined Runtime Attributes to set
    // placeholder and placeholderColor in Interface Builder.
    if (!self.placeholder) {
        [self setPlaceholder:@""];
    }
    
    if (!self.placeholderColor) {
        [self setPlaceholderColor:[UIColor lightGrayColor]];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (id)initWithFrame:(CGRect)frame
{
    if( (self = [super initWithFrame:frame]) )
    {
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textChanged:(NSNotification *)notification
{
    if([[self placeholder] length] == 0)
    {
        return;
    }
    
    [UIView animateWithDuration:UI_PLACEHOLDER_TEXT_CHANGED_ANIMATION_DURATION animations:^{
        if([[self text] length] == 0)
        {
            [[self viewWithTag:999] setAlpha:1];
        }
        else
        {
            [[self viewWithTag:999] setAlpha:0];
        }
    }];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)drawRect:(CGRect)rect
{
    if( [[self placeholder] length] > 0 )
    {
        if (_placeHolderLabel == nil )
        {
            _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8,8,self.bounds.size.width - 16,0)];
            _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeHolderLabel.numberOfLines = 0;
            _placeHolderLabel.font = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = self.placeholderColor;
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = 999;
            [self addSubview:_placeHolderLabel];
        }
        
        _placeHolderLabel.text = self.placeholder;
        [_placeHolderLabel sizeToFit];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 )
    {
        [[self viewWithTag:999] setAlpha:1];
    }
    
    [super drawRect:rect];
}


-(void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"textViewDidBeginEditing = %@",textView.text);
    
    if([_delegatePlaceholder respondsToSelector:@selector(UIPlaceHolderTextViewTextView:)])
        [_delegatePlaceholder UIPlaceHolderTextViewTextView:textView.text];
}

- (void)textViewDidChange:(UITextView *)textView{
    
    NSLog(@"textViewDidChange = %@",textView.text);
    if([_delegatePlaceholder respondsToSelector:@selector(UIPlaceHolderTextViewTextView:)])
        [_delegatePlaceholder UIPlaceHolderTextViewTextView:textView.text];
}


- (void)textViewDidEndEditing:(UITextView *)textView {
    
    NSLog(@"textViewDidEndEditing = %@",textView.text);
    if([_delegatePlaceholder respondsToSelector:@selector(UIPlaceHolderTextViewTextView:)])
        [_delegatePlaceholder UIPlaceHolderTextViewTextView:textView.text];
    if([_delegatePlaceholder respondsToSelector:@selector(UIPlaceHolderTextViewTextViewNew:)])
        [_delegatePlaceholder UIPlaceHolderTextViewTextViewNew:textView.text];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    }
    else
    {
        NSLog(@"Other pressed");
    }
    return YES;
}




@end
