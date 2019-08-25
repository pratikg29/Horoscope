//
//  GoogleAds.h
//  Photo Art Filter
//
//  Created by Maulik on 09/01/19.
//  Copyright © 2019 Pankaj Bhalala. All rights reserved.
//

#import <Foundation/Foundation.h>
@import GoogleMobileAds;

NS_ASSUME_NONNULL_BEGIN

@interface GoogleAds : NSObject <GADInterstitialDelegate>

+(GoogleAds*)sharedInstance;
-(void)LoadAndShowFullScreenAd;

@end

NS_ASSUME_NONNULL_END
