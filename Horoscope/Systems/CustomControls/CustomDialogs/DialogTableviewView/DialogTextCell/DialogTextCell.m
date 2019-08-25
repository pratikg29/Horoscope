//
//  DialogTextCell.m
//  Scelgo Salento
//
//  Created by mac1 on 01/03/17.
//  Copyright © 2017 Socialinfotech. All rights reserved.
//

#import "DialogTextCell.h"

@implementation DialogTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    //self.contentView.translatesAutoresizingMaskIntoConstraints = YES;
    [self initKit];
    // Initialization code
}

-(void)initKit
{
    //[self.BackView initWithAppCellProperties];
    
    [self.lbl_str_text initWithAppPropertiesColorSec];
    [self.lbl_str_text initWithAppPropertiesSize:kDefaultFontSizeMedium Type:DFONTREGULAR];
    
    self.imgview_down.image = @"";
    
}

-(void)initWithDialogTextCell:(NSString *)str
{
    self.lbl_str_text.text = str;
}

/*- (void) setSelected:(BOOL)selected;
{
    [super setSelected:selected];
    [self layoutIfNeeded]; // force layout to avoid UICollectionView animation
    
    UIView * selectedBackgroundView = [[UIView alloc] init];
    [selectedBackgroundView setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.1]]; // set color here
    
    [self setSelectedBackgroundView:selectedBackgroundView];

}*/

@end
