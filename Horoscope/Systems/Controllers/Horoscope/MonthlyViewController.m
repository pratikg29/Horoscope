//
//  MonthlyViewController.m
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "MonthlyViewController.h"

@interface MonthlyViewController ()

@end

@implementation MonthlyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getHoroscropeData];
    [self initKit];
    [self initWithAds];
    // Do any additional setup after loading the view.
}

-(void)initWithAds
{
    NSString *AdsBanner = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"AdsBanner"];
    self.bannerView.adUnitID = AdsBanner;
    self.bannerView.rootViewController = (id)self;
    GADRequest *request = [GADRequest request];
    [self.bannerView loadRequest:request];
}

-(void)initKit
{
    self.ImgLoader.image = [UIImage sd_animatedGIFNamed:@"loader"];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        [self.txtView initWithAppPropertiesSize:kDefaultFontSizeExtraLarge20 Type:DFONTMEDIUM];
    }
    else
    {
        [self.txtView initWithAppPropertiesSize:kDefaultFontSizeExtraLarge Type:DFONTMEDIUM];
    }
}


-(void)getHoroscropeData
{
    NSString *strURL = [NSString stringWithFormat:@"http://dailyhoroscopeapi.idailybread.com/horoscope/monthly?offset=0&horoscopeName=%@&currentDateString=%@",self.strHoroName,[Helpers getCurrentDataTime]];
    self.ImgLoader.hidden = NO;
    [WebService getWithUrlString:strURL parameters:nil progress:nil success:^(NSDictionary *response) {
        
        NSLog(@"%@",response);
        self.ImgLoader.hidden = YES;
        self.txtView.text = [[response valueForKey:@"data"]valueForKey:@"content"];
        
    } failure:^(NSError *error) {
        
        self.ImgLoader.hidden = YES;
        NSLog(@"%@",error.localizedDescription);
        
    }];
}

@end
