//
//  CSAlwaysOnTopHeader.h
//  CSStickyHeaderFlowLayoutDemo
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "CSCell.h"
#import "KASlideShow.h"

@interface CSAlwaysOnTopHeader : CSCell<KASlideShowDataSource, KASlideShowDelegate>{
    NSMutableArray * _datasource;
}
@property (strong,nonatomic) IBOutlet KASlideShow * slideshow;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

@property (nonatomic) CGFloat Imgheight;
//common
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel_2;
@property (weak, nonatomic) IBOutlet UITextView *subtitleTextView;
@property (weak, nonatomic) IBOutlet UIView *subtitleView;
@property (weak, nonatomic) IBOutlet UIView *viewHeader;
@property (weak, nonatomic) IBOutlet UIImageView *imgCoverPhoto;

//pages
@property (strong, nonatomic)IBOutlet UIButton *btnBack;
@property (strong, nonatomic)IBOutlet UIButton *btnMap;
@property (strong, nonatomic)IBOutlet UIButton *btnShare;
//mainContentView
@property (weak, nonatomic) IBOutlet UIView *viewMainContent;

@property(nonatomic,retain)IBOutlet UIView *view_topbar;
@property(nonatomic,retain)IBOutlet EPButton *btn_back;
@property(nonatomic,retain)IBOutlet UILabel *lbl_title;

-(void)fillDataInSlideShow:(NSArray *)array;

@end
