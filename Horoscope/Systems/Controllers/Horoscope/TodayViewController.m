//
//  TodayViewController.m
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "TodayViewController.h"

@interface TodayViewController ()

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_isCharacteristics) {
        [self setCharacteristicsTextviewString];
    }
    else {
        [self getHoroscropeData];
    }
    [self initKit];
    [self initWithAds];
    // Do any additional setup after loading the view.
}

- (void)setCharacteristicsTextviewString {
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[self.strText dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    NSMutableAttributedString *newString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    NSRange range = (NSRange){0,[newString length]};
    [newString enumerateAttribute:NSFontAttributeName inRange:range options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(id value, NSRange range, BOOL *stop) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        {
            UIFont *replacementFont =  [UIFont fontWithName:@"Futura" size:22];
            [newString addAttribute:NSFontAttributeName value:replacementFont range:range];
            UIColor *color = [UIColor blackColor];
            [newString addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
        else
        {
            UIFont *replacementFont =  [UIFont fontWithName:@"Futura" size:16];
            [newString addAttribute:NSFontAttributeName value:replacementFont range:range];
            UIColor *color = [UIColor blackColor];
            [newString addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }];
    self.txtView.attributedText = newString;
}

-(void)initWithAds
{
    NSString *AdsBanner = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"AdsBanner"];
    self.bannerView.adUnitID = AdsBanner;
    self.bannerView.rootViewController = (id)self;
    GADRequest *request = [GADRequest request];
    [self.bannerView loadRequest:request];
    [[GoogleAds sharedInstance] LoadAndShowFullScreenAd];
}

-(void)initKit
{
    [_blurView.layer setCornerRadius:12];
    [_blurView setClipsToBounds:TRUE];
    self.ImgLoader.image = [UIImage sd_animatedGIFNamed:@"loader"];
    [_lblTitle setText:_strHoroTitle];
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//    {
//        [self.txtView initWithAppPropertiesSize:kDefaultFontSizeExtraLarge20 Type:DFONTMEDIUM];
//    }
//    else
//    {
//        [self.txtView initWithAppPropertiesSize:kDefaultFontSizeExtraLarge Type:DFONTMEDIUM];
//    }
    
}

- (void)viewWillAppear:(BOOL)animated {
}



-(void)getHoroscropeData
{
    NSString *strURL = [NSString stringWithFormat:_apiURL,self.strHoroName,[Helpers getCurrentDataTime]];
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

- (IBAction)onBackBtn:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:TRUE];
}
@end
