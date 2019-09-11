//
//  SidemenuItemsCell.h
//  Task Away
//
//  Created by mac1 on 09/11/16.
//  Copyright © 2016 Socialinfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+DLabel.h"

@interface SidemenuItemsCell : UITableViewCell
@property(nonatomic,retain)IBOutlet UILabel *lbl_name;
@property(nonatomic,retain)IBOutlet UIImageView *imgView_icon;
@property (strong, nonatomic) IBOutlet UIView *container;

@end
