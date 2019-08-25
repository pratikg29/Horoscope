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

@interface PageMenuViewController ()
@end

@implementation PageMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self PageMenuSetup];
    [self initKit];
    [[GoogleAds sharedInstance] LoadAndShowFullScreenAd];
    // Do any additional setup after loading the view.
}

-(void)initKit
{
    [self.HeaderView initWithAppPropertiesHeader];
    [self.lblTitle initWithAppPropertiesSize:kDefaultFontSizeExtraLarge20 Type:DFONTMEDIUM];
    [self.lblTitle initWithAppPropertiesColorWhite];
    self.lblTitle.text = self.strHoroTitle;
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
        _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 64.0, self.view.frame.size.width, self.view.frame.size.height-65) options:parameters];
    }
    else
    {
        _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) options:parameters];
    }
    
    [self.view addSubview:_pageMenu.view];
    
}

@end
