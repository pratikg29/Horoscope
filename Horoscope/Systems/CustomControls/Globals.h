//
//  Globals.h
//  ObjectMappingDemo
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "AppDelegate.h"
#import "ToastMessage.h"
#import "Reachability.h"
#import "Validate.h"
#import "UIView+Toast.h"
#import "ProgressHUD.h"
#import "CAPSPageMenu.h"


#ifndef Globals_h
#define Globals_h

/******************************** Defaults *********************************/

#define DelegateObject          ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define IS_OS_8_OR_LATER        ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define D_IS_IPAD               (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define D_IS_IPHONE             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define D_IS_RETINA             ([[UIScreen mainScreen] scale] >= 2.0)

#define D_SCREEN_WIDTH          ([[UIScreen mainScreen] bounds].size.width)
#define D_SCREEN_HEIGHT         ([[UIScreen mainScreen] bounds].size.height)
#define D_SCREEN_MAX_LENGTH     (MAX(D_SCREEN_WIDTH, D_SCREEN_HEIGHT))
#define D_SCREEN_MIN_LENGTH     (MIN(D_SCREEN_WIDTH, D_SCREEN_HEIGHT))


#define MENU_WIDTH  D_SCREEN_WIDTH*4/5
#define SIDEMENU_FRAME CGRectMake(D_SCREEN_WIDTH, 0, MENU_WIDTH, D_SCREEN_HEIGHT)

#define D_IS_IPHONE_4_OR_LESS   (D_IS_IPHONE && D_SCREEN_MAX_LENGTH < 568.0)
#define D_IS_IPHONE_5           (D_IS_IPHONE && D_SCREEN_MAX_LENGTH == 568.0)
#define D_IS_IPHONE_6           (D_IS_IPHONE && D_SCREEN_MAX_LENGTH == 667.0)
#define D_IS_IPHONE_6P          (D_IS_IPHONE && D_SCREEN_MAX_LENGTH == 736.0)
#define D_IS_IPAD_PRO           (D_IS_IPAD && D_SCREEN_MAX_LENGTH == 1366.0)


#define Tag_isLogin [[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"]

//http://appstarllc.net/app/uploads/category/

//Google Image Url
#define API_GoogleImage @"https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=%@&sensor=false&key=%@"

#define URL_Base @"http://vacay.fyi/"
#define URL_main URL_Base@"app/"
#define URL_IMG_DIR URL_main@"uploads/"
#define URL_IMG_categoryImage URL_IMG_DIR@"category/"
#define URL_IMG_BannerImage URL_IMG_DIR@"banner/"
#define URL_IMG_PostImage URL_IMG_DIR@"postimages/"
#define URL_IMG_UserImage URL_IMG_DIR@"profile/user"

#define URL_IMG_large URL_IMG_DIR@"large/"
#define URL_IMG_medium URL_IMG_DIR@"medium/"
#define URL_IMG_original URL_IMG_DIR@"original/"
#define URL_IMG_thumb URL_IMG_DIR@"thumb/"

//Near Me App
#define API_Login URL_main@"login"

//HORODCOPE API
#define API_Yersterday @"http://dailyhoroscopeapi.idailybread.com/horoscope/daily?offset=-1&horoscopeName=%@&currentDateString=%@"
#define API_Today @"http://dailyhoroscopeapi.idailybread.com/horoscope/daily?offset=0&horoscopeName=%@&currentDateString=%@"
#define API_Tomorrow @"http://dailyhoroscopeapi.idailybread.com/horoscope/daily?offset=1&horoscopeName=%@&currentDateString=%@"
#define API_Weekly @"http://dailyhoroscopeapi.idailybread.com/horoscope/weekly?offset=0&horoscopeName=%@&currentDateString=%@"
#define API_Monthly @"http://dailyhoroscopeapi.idailybread.com/horoscope/monthly?offset=0&horoscopeName=%@&currentDateString=%@"
#define API_Yearly @"http://dailyhoroscopeapi.idailybread.com/horoscope/yearly?offset=0&horoscopeName=%@&currentDateString=%@"

#endif


