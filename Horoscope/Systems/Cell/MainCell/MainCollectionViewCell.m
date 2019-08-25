//
//  MainCollectionViewCell.m
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "MainCollectionViewCell.h"

@implementation MainCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initKit];
    // Initialization code
}

-(void)initKit
{
    [self.lblTitle initWithAppPropertiesSize:kDefaultFontSizeLarge Type:DFONTMEDIUM];
    [self.lblTitle initWithAppPropertiesColorWhite];
}

@end
