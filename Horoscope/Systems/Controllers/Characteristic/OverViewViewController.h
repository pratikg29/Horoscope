//
//  OverViewViewController.h
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "init.h"

@interface OverViewViewController : UIViewController

@property (strong, nonatomic) NSString *strHoroTitle;
@property (strong, nonatomic) NSString *strText;

@property (strong, nonatomic) IBOutlet UITextView *txtView;

@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@property (weak, nonatomic) IBOutlet UIView *HeaderView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@end
