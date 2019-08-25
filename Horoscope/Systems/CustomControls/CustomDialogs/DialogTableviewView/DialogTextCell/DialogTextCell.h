//
//  DialogTextCell.h
//  Scelgo Salento
//
//  Created by mac1 on 01/03/17.
//  Copyright © 2017 Socialinfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "init.h"

@interface DialogTextCell : UITableViewCell
@property(nonatomic,retain)IBOutlet UIView *BackView;
@property(nonatomic,retain)IBOutlet UILabel *lbl_str_text;
@property(nonatomic,retain)IBOutlet UIImageView *imgview_down;

-(void)initWithDialogTextCell:(NSString *)str;
@end
