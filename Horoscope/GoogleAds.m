//
//  GoogleAds.m
//  Photo Art Filter
//
//  Created by Maulik on 09/01/19.
//  Copyright © 2019 Pankaj Bhalala. All rights reserved.
//

#import "GoogleAds.h"
#import "Constant.h"


static GoogleAds *ads = nil;
@implementation GoogleAds
{
    GADInterstitial *interstitial;
    BOOL inPandding;
}

+(GoogleAds*)sharedInstance
{
    if(ads == nil)
    {
        ads = [[GoogleAds alloc] init];
    }
    return ads;
}


- (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
    NSLog(@"interstitialDidReceiveAd");
}
-(void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error
{
    inPandding = false;
    NSLog(@"ERROR ==> %@", error.description);
}
-(void)interstitialWillDismissScreen:(GADInterstitial *)ad
{
    interstitial = nil;
    //    isSuccessfullyServe = true;
    //    [self LoadFullScreenAd];
    inPandding = false;
    [self LoadAndShowFullScreenAd];
}

-(void)LoadAndShowFullScreenAd
{
    if(interstitial.isReady)
    {
        [interstitial presentFromRootViewController:[AppDelegate sharedInstance].window.rootViewController];
    }
    else if(inPandding == false && GAdInterstitialKey != nil)
    {
        inPandding = true;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            interstitial = [[GADInterstitial alloc] initWithAdUnitID:GAdInterstitialKey];
            interstitial.delegate = self;
            [interstitial loadRequest: [GADRequest request]];
        });
        
    }
}


@end
