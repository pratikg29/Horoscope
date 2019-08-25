//
//  TodayViewController.h
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "init.h"

@interface TodayViewController : UIViewController

@property (strong, nonatomic) UIViewController *superViewController;
@property (strong, nonatomic) NSString *strHoroName;
@property (strong, nonatomic) NSString *strHoroTitle;
@property (strong, nonatomic) IBOutlet UITextView *txtView;
@property (strong, nonatomic) IBOutlet UIImageView *ImgLoader;

@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@end
