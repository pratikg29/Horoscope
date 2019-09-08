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

@property NSString *apiURL;
@property (strong, nonatomic) UIViewController *superViewController;
@property (strong, nonatomic) NSString *strHoroName;
@property (strong, nonatomic) NSString *strHoroTitle;
@property (strong, nonatomic) IBOutlet UITextView *txtView;
@property (strong, nonatomic) IBOutlet UIImageView *ImgLoader;

@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
- (IBAction)onBackBtn:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *blurView;

@property (strong, nonatomic) IBOutlet UIView *galaxyView;
@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;

@end
