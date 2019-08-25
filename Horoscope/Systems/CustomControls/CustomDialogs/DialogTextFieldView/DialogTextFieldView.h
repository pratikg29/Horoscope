//
//  DialogTextFieldView.h
//  MusicPlay
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Extensions.h"
#import "KLCPopup.h"


#define kDefaultDialogtitle                 @"Save Info."
#define kDefaultDialogplaceholder           @"Enter title"
#define kDefaultDialogsaveButtonName        @"SAVE"
#define kDefaultDialogdismissButtonName     @"DISMISS"


@protocol DialogTextFieldViewDelegate <NSObject>
@optional
- (void)saveClicked :(NSString *)text;
- (void)dismissClicked;
@end

@interface DialogTextFieldView : UIView
{
    NSString *str_title;
    NSString *str_placeholder;
    NSString *str_saveButtonName;
    NSString *str_dismissButtonName;
    KLCPopup* popup;
    
}
@property(nonatomic, weak) id<DialogTextFieldViewDelegate> delegate;

@property(nonatomic) NSString *str_title;
@property(nonatomic) NSString *str_placeholder;
@property(nonatomic) NSString *str_saveButtonName;
@property(nonatomic) NSString *str_dismissButtonName;
@property(nonatomic,retain)IBOutlet UILabel *lbl_title;
@property(nonatomic,retain)IBOutlet EPButton *btn_save,*btn_dismiss;
@property(nonatomic,retain)IBOutlet EPTextField *txtField_filename;




-(id)initWithSuperView:(UIViewController *)superView;
-(id)initWithSuperView:(UIViewController *)superView title:(NSString *)title placeholder:(NSString *)placeholder saveButton:(NSString *)saveButton dismissButton:(NSString *)dismissButton;
-(void)click_popup;
@end
