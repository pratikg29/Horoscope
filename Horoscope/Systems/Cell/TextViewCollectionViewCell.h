//
//  TextViewCollectionViewCell.h
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "init.h"

@interface TextViewCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIView *BackView;
@property (strong, nonatomic) IBOutlet UITextView *txtView;
@end
