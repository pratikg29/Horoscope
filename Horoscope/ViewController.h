//
//  ViewController.h
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "init.h"

@interface ViewController : UIViewController<CoverViewDelegate>
{
    SideView *sideView;
    CoverView *bgCoverView;
    
}

@property (strong, nonatomic) CAPSPageMenu *pageMenu;

@property (strong, nonatomic) IBOutlet UIView *HeaderView;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (nonatomic) BOOL isRate;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *array_data;
@property (strong, nonatomic) NSMutableArray *array_name;
@property (strong, nonatomic) NSMutableArray *array_title;
@property (strong, nonatomic) IBOutlet GADBannerView *bannerView;

@end
