//
//  MoreViewController.h
//  Horoscope
//
//  Created by pratik gadhesariya on 11/09/19.
//  Copyright © 2019 Dh@rmik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "init.h"

@interface MoreViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic,copy) NSArray *MenuNames,*MenuImages;

@property (strong, nonatomic) IBOutlet UIView *galaxyView;
@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;

@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet GADBannerView *bannerView;

@end
