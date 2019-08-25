//
//  DialogTextFieldView.m
//  MusicPlay
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "DialogTextFieldView.h"

@interface DialogTextFieldView ()

@property (nonatomic,retain)UIViewController *superController;

@end

@implementation DialogTextFieldView
@synthesize str_title,str_placeholder,str_saveButtonName,str_dismissButtonName;


-(id)initWithSuperView:(UIViewController *)superView
{
    self = [self initFrame];
    
    if (self) {
        self.superController = superView;
        [self setTexts];
        [self initKit];
        
    }
    
    return self;
}


-(id)initWithSuperView:(UIViewController *)superView title:(NSString *)title placeholder:(NSString *)placeholder saveButton:(NSString *)saveButton dismissButton:(NSString *)dismissButton
{
    self = [self initFrame];
    
    if (self) {
        self.superController = superView;
        
        str_title = title;
        str_placeholder = placeholder;
        str_saveButtonName = saveButton;
        str_dismissButtonName = dismissButton;
        
        
        [self setTexts];
        [self initKit];
      
    }
    
    return self;
}

-(id)initFrame
{
    
    UINib *DialogView = [UINib nibWithNibName:@"DialogTextFieldView" bundle:nil];
    NSArray *nibArr = [DialogView instantiateWithOwner:nil options:nil];
    
    self = (DialogTextFieldView *)[nibArr lastObject];
    
    
    if (self) {
        CGFloat widthx = D_SCREEN_WIDTH - 32;
        CGFloat xpos = (D_SCREEN_WIDTH-(widthx))/2;
        CGFloat ypos = (D_SCREEN_HEIGHT-(180))/2;
        self.frame = CGRectMake(xpos,ypos ,widthx , 180);
        self.alpha = 0;
        
    }
    
    
    return self;
}



-(void)initKit
{
    [self initWithAppDialogViewProperties];
    [self.txtField_filename initWithAppPropertiesSize:kDefaultFontSizeLarge Type:DFONTMEDIUM Placeholder:@""];
    [self.lbl_title initWithAppPropertiesSize:kDefaultFontSizeExtraLarge Type:DFONTLARGE];
   
    [self.btn_save initWithAppPropertiesDialogButtonsSize:kDefaultFontSizeMedium Type:DFONTLARGE];
    [self.btn_dismiss initWithAppPropertiesDialogButtonsSize:kDefaultFontSizeMedium Type:DFONTLARGE];
}

-(void)setTexts
{
    if ([str_title isEqualToString:@""] || str_title==nil) {
        str_title = kDefaultDialogtitle;
    }
    if ([str_placeholder isEqualToString:@""] || str_placeholder==nil) {
        str_placeholder = kDefaultDialogplaceholder;
    }
    if ([str_saveButtonName isEqualToString:@""] || str_saveButtonName==nil) {
        str_saveButtonName = kDefaultDialogsaveButtonName;
    }
    if ([str_dismissButtonName isEqualToString:@""] || str_dismissButtonName==nil) {
        str_dismissButtonName = kDefaultDialogdismissButtonName;
    }
    
    [self.lbl_title setText:str_title];
    [self.txtField_filename setPlaceholder:str_placeholder];
    [self.btn_save setTitle:str_saveButtonName forState:UIControlStateNormal];
    [self.btn_dismiss setTitle:str_dismissButtonName forState:UIControlStateNormal];
}

-(void)click_popup
{
    self.txtField_filename.text = @"";
    //[self.txtField_filename becomeFirstResponder];
    self.alpha = 1;
    KLCPopupLayout layout = KLCPopupLayoutMake(KLCPopupHorizontalLayoutCenter, KLCPopupVerticalLayoutCenter);
    
    popup = [KLCPopup popupWithContentView:self showType:KLCPopupShowTypeGrowIn dismissType:KLCPopupDismissTypeGrowOut maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
    [popup showWithLayout:layout];

}

-(IBAction)click_save:(id)sender
{
    [self.txtField_filename resignFirstResponder];
    
    [popup dismiss:YES];
    if([_delegate respondsToSelector:@selector(saveClicked:)])
        [_delegate saveClicked:self.txtField_filename.text];
    
}

-(IBAction)click_dismiss:(id)sender
{
    [self.txtField_filename resignFirstResponder];
    NSLog(@"dismiss clicked");
    [popup dismiss:YES];
    if([_delegate respondsToSelector:@selector(dismissClicked)])
        [_delegate dismissClicked];
}


#pragma mark - TextFields Delegates

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    self.frame = CGRectMake(0, -100, self.frame.size.width, self.frame.size.height);
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
    self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    return YES;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
