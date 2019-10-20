//
//  PageMenuViewController.m
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "PageMenuViewController.h"
#import "YesterdayViewController.h"
#import "TodayViewController.h"
#import "TomorrowViewController.h"
#import "WeeklyViewController.h"
#import "MonthlyViewController.h"
#import "YearlyViewController.h"
#import "HoroscopeSelectionCell.h"
#import "OverViewViewController.h"
@interface PageMenuViewController ()
@end

@implementation PageMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    characteristicsArr = [[NSMutableArray alloc] initWithObjects:@"Personality", @"Love", @"Lifestyle", @"Career", @"Health", @"Friendship", nil];
    
    listArr = [[NSMutableArray alloc] initWithObjects:@"Yesterday Horoscope", @"Today Horoscope", @"Tomorrow Horoscope", @"Weekly Horoscope", @"Monthly Horoscope", @"Yearly Horoscope", nil];
    urlArr = [[NSMutableArray alloc] initWithObjects:API_Yersterday, API_Today, API_Tomorrow, API_Weekly, API_Monthly, API_Yearly, nil];
    
//    [self PageMenuSetup];
    [self initKit];
}

- (void)viewWillAppear:(BOOL)animated {

}


-(void)initKit
{
//    [self.HeaderView initWithAppPropertiesHeader];
    [self.lblTitle initWithAppPropertiesSize:kDefaultFontSizeExtraLarge20 Type:DFONTMEDIUM];
    [self.lblTitle initWithAppPropertiesColorWhite];
    self.lblTitle.text = self.strHoroTitle;
    [self initWithAds];
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

-(void)PageMenuSetup
{
    YesterdayViewController *controller1 = [self.storyboard instantiateViewControllerWithIdentifier:@"YesterdayViewController"];
    controller1.superViewController = self;
    controller1.strHoroName = self.strHoroName;
    controller1.strHoroTitle = self.strHoroTitle;
    controller1.title = @"Yesterday";
    
    TodayViewController *controller2 = [self.storyboard instantiateViewControllerWithIdentifier:@"TodayViewController"];
    controller2.superViewController = self;
    controller2.strHoroName = self.strHoroName;
    controller2.strHoroTitle = self.strHoroTitle;
    controller2.title = @"Today";
    
    TomorrowViewController *controller3 = [self.storyboard instantiateViewControllerWithIdentifier:@"TomorrowViewController"];
    controller3.superViewController = self;
    controller3.strHoroName = self.strHoroName;
    controller3.strHoroTitle = self.strHoroTitle;
    controller3.title = @"Tomorrow";
    
    WeeklyViewController *controller4 = [self.storyboard instantiateViewControllerWithIdentifier:@"WeeklyViewController"];
    controller4.superViewController = self;
    controller4.strHoroName = self.strHoroName;
    controller4.strHoroTitle = self.strHoroTitle;
    controller4.title = @"Weekly";
    
    MonthlyViewController *controller5 = [self.storyboard instantiateViewControllerWithIdentifier:@"MonthlyViewController"];
    controller5.superViewController = self;
    controller5.strHoroName = self.strHoroName;
    controller5.strHoroTitle = self.strHoroTitle;
    controller5.title = @"Monthly";
    
    YearlyViewController *controller6 = [self.storyboard instantiateViewControllerWithIdentifier:@"YearlyViewController"];
    controller6.superViewController = self;
    controller6.strHoroName = self.strHoroName;
    controller6.strHoroTitle = self.strHoroTitle;
    controller6.title = @"Yearly";
    
    NSArray *controllerArray = @[controller1, controller2,controller3,controller4,controller5,controller6];
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor:kDefaultThemeColorHeader,
                                 CAPSPageMenuOptionViewBackgroundColor:[UIColor whiteColor],
                                 CAPSPageMenuOptionSelectionIndicatorColor: kDefaultLabelTextColorWhite,
                                 CAPSPageMenuOptionSelectedMenuItemLabelColor:kDefaultLabelTextColorWhite,
                                 CAPSPageMenuOptionUnselectedMenuItemLabelColor:kDefaultTextColorSecondary,
                                 CAPSPageMenuOptionMenuItemFont: [DUIFont DfontRoboto_MediumWithSize:kDefaultFontSizeLarge],
                                 CAPSPageMenuOptionMenuHeight: @(40.0),
                                 CAPSPageMenuOptionMenuItemWidth: @(D_SCREEN_WIDTH/3 - 20),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES)
                                 };
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0, 0, _ContainerView.frame.size.width, _ContainerView.frame.size.height) options:parameters];
        
//        _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 64.0, self.view.frame.size.width, self.view.frame.size.height-65) options:parameters];
    }
    else
    {
        _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) options:parameters];
    }
    
    [self.ContainerView addSubview:_pageMenu.view];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isCharacteristics) {
        return characteristicsArr.count;
    }
    else {
        return listArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HoroscopeSelectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (_isCharacteristics) {
        [cell.lbl setText:characteristicsArr[indexPath.row]];
    }
    else {
        [cell.lbl setText:listArr[indexPath.row]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_isCharacteristics) {
        TodayViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TodayViewController"];
        vc.isCharacteristics = TRUE;
        vc.strHoroTitle = self.strHoroTitle;
        vc.strText = [self.array_data objectAtIndex:1];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else {
        TodayViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"TodayViewController"];
        controller.superViewController = self;
        controller.strHoroName = self.strHoroName;
        controller.strHoroTitle = listArr[indexPath.row];
        controller.apiURL = urlArr[indexPath.row];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
