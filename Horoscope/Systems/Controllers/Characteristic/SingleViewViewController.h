//
//  SingleViewViewController.h
//  Horoscope
//
//  Created by PC on 9/23/18.
//  Copyright © 2018 Dh@rmik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "init.h"

@interface SingleViewViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *array_data;
@property (strong, nonatomic) NSString *strHoroTitle;

@property (weak, nonatomic) IBOutlet UIView *HeaderView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@end
