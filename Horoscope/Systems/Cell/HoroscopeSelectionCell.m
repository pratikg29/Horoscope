//
//  HoroscopeSelectionCell.m
//  Horoscope
//
//  Created by pratik gadhesariya on 08/09/19.
//  Copyright © 2019 Dh@rmik. All rights reserved.
//

#import "HoroscopeSelectionCell.h"

@implementation HoroscopeSelectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configureCell];
    // Initialization code
}

- (void)configureCell {
    [_container.layer setCornerRadius:12];
    [_container setClipsToBounds:TRUE];
    
    self.contentView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.contentView.layer.shadowOffset = CGSizeMake(0, 5);
    self.contentView.layer.shadowRadius = 10;
    self.contentView.layer.shadowOpacity = 0.7;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
