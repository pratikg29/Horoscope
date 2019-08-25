//
//  SingleViewViewController.m
//  Horoscope
//
//  Created by PC on 9/23/18.
//  Copyright © 2018 Dh@rmik. All rights reserved.
//

#import "SingleViewViewController.h"
#import "OverViewViewController.h"

@interface SingleViewViewController ()
@end

@implementation SingleViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initKit];
    [self initWithAds];
    [[GoogleAds sharedInstance] LoadAndShowFullScreenAd];
    // Do any additional setup after loading the view.
}

-(void)initKit
{
    [self.lblTitle initWithAppPropertiesSize:kDefaultFontSizeExtraLarge20 Type:DFONTMEDIUM];
    [self.lblTitle initWithAppPropertiesColorWhite];
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



- (IBAction)Click_Back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)Click_Personality:(id)sender {
    
    OverViewViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OverViewViewController"];
    vc.strHoroTitle = self.strHoroTitle;
    vc.strText = [self.array_data objectAtIndex:0];
    [self.navigationController pushViewController:vc animated:YES];

}

- (IBAction)Click_Love:(id)sender {
    
    OverViewViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OverViewViewController"];
    vc.strHoroTitle = self.strHoroTitle;
    vc.strText = [self.array_data objectAtIndex:1];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)Click_LifeStyle:(id)sender {
    
    OverViewViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OverViewViewController"];
    vc.strHoroTitle = self.strHoroTitle;
    vc.strText = [self.array_data objectAtIndex:2];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)Click_Career:(id)sender {
    
    OverViewViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OverViewViewController"];
    vc.strHoroTitle = self.strHoroTitle;
    vc.strText = [self.array_data objectAtIndex:3];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)Click_Health:(id)sender {
    
    OverViewViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OverViewViewController"];
    vc.strHoroTitle = self.strHoroTitle;
    vc.strText = [self.array_data objectAtIndex:4];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)Click_Friendship:(id)sender {
    
    OverViewViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OverViewViewController"];
    vc.strHoroTitle = self.strHoroTitle;
    vc.strText = [self.array_data objectAtIndex:5];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
