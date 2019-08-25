//
//  TextViewCollectionViewCell.m
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "TextViewCollectionViewCell.h"

@implementation TextViewCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initKit];
    // Initialization code
}

-(void)initKit
{
    self.BackView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.BackView.layer.borderWidth = 1.5;
    self.BackView.layer.cornerRadius = 15;
}

@end
