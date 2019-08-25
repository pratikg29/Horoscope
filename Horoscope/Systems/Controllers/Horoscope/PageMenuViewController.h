//
//  PageMenuViewController.h
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "init.h"

@interface PageMenuViewController : UIViewController

@property (strong, nonatomic) CAPSPageMenu *pageMenu;

@property (strong, nonatomic) IBOutlet UIView *HeaderView;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

@property (strong, nonatomic) NSString *strHoroName;
@property (strong, nonatomic) NSString *strHoroTitle;

@end
