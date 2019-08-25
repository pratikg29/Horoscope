//
//  SidemenuProfileCell.m
//  Task Away
//
//  Created by mac1 on 09/11/16.
//  Copyright © 2016 Socialinfotech. All rights reserved.
//

#import "SidemenuProfileCell.h"
#import "UILabel+DLabel.h"
#import "UIImageView+DImageView.h"
#import "UIView+DView.h"

@implementation SidemenuProfileCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initKit];
    
    // Initialization code
}

-(void)initKit
{
    //[self.BackView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@""]]];
 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    else
    {
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    // Configure the view for the selected state
}

@end
