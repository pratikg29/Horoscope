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
    [_blurView.layer setCornerRadius:12];//_blurView.frame.size.height/2
    [_blurView setClipsToBounds:TRUE];
    [_blurView.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_blurView.layer setBorderWidth:2];
    [self.lblTitle initWithAppPropertiesSize:kDefaultFontSizeLarge Type:DFONTMEDIUM];
    [self.lblTitle initWithAppPropertiesColorWhite];
}

@end
