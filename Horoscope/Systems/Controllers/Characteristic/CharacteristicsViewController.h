//
//  CharacteristicsViewController.h
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "init.h"

@interface CharacteristicsViewController : UIViewController<CoverViewDelegate>
{
    SideView *sideView;
    CoverView *bgCoverView;
    
}

@property (strong, nonatomic) UIViewController *superViewController;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIView *HeaderView;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) NSMutableArray *array_data;
@property (strong, nonatomic) NSMutableArray *array_name;
@property (strong, nonatomic) NSMutableArray *array_title;
@property (strong, nonatomic) IBOutlet GADBannerView *bannerView;
@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;

@end
