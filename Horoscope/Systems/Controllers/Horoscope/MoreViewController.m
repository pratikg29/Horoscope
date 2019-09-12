//
//  MoreViewController.m
//  Horoscope
//
//  Created by pratik gadhesariya on 11/09/19.
//  Copyright © 2019 Dh@rmik. All rights reserved.
//

#import "MoreViewController.h"
#import "SidemenuItemsCell.h"
#import "UIImageView+DImageView.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.MenuNames = @[@"Share App",@"Rate US",@"Privacy Policy"];
    self.MenuImages = @[@"ic_share",@"ic_rate",@"ic_privacy_policy"];
    [self initWithAds];
}

- (void)viewWillAppear:(BOOL)animated {
    [self rotatingAnimation:_img1 duration:40 from:[NSNumber numberWithFloat:0.0f] to:[NSNumber numberWithFloat: 2*M_PI]];
    [self rotatingAnimation:_img2 duration:70 from:[NSNumber numberWithFloat: 2*M_PI] to:[NSNumber numberWithFloat:0.0f]];
    [self rotatingAnimation:_img3 duration:60 from:[NSNumber numberWithFloat:0.0f] to:[NSNumber numberWithFloat: 2*M_PI]];
    [[GoogleAds sharedInstance] LoadAndShowFullScreenAd];
}
- (void)rotatingAnimation: (UIImageView *)image duration: (float)duration from: (NSNumber*)From to: (NSNumber*)To {
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = From;
    animation.toValue = To;
    animation.duration = duration;
    animation.repeatCount = INFINITY;
    [image.layer addAnimation:animation forKey:@"SpinAnimation"];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.MenuNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SidemenuItemsCell *cell = (SidemenuItemsCell *)[tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    
    if(cell == nil)
    {
        NSArray *nib;
        nib = [[NSBundle mainBundle]loadNibNamed:@"SidemenuItemsCell" owner:self options:nil];
//        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
//        {
//            nib = [[NSBundle mainBundle]loadNibNamed:@"SidemenuItemsCell" owner:self options:nil];
//        }
//        else
//        {
//            nib = [[NSBundle mainBundle]loadNibNamed:@"SidemenuItemsCelliPad" owner:self options:nil];
//
//        }
        cell = [nib objectAtIndex:0];
    }
    
    NSLog(@"%@",[self.MenuNames objectAtIndex:indexPath.row]);
    cell.lbl_name.text = [self.MenuNames objectAtIndex:indexPath.row];
    cell.imgView_icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.MenuImages[indexPath.row]]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
////    {
////        return 70;
////    }
//    return tableView.estimatedRowHeight;
//}

#pragma mark - tableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SidemenuItemsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"%ld",(long)indexPath.row);
    switch (indexPath.row)
    {
        case 0:
        {
            NSString *sharedMsg=[NSString stringWithFormat:@"https://itunes.apple.com/us/app/daily-horoscope-zodiac-sings/id1449032380?ls=1&mt=8"];
            NSArray* sharedObjects=[NSArray arrayWithObjects:sharedMsg, nil];
            UIActivityViewController *activityViewController = [[UIActivityViewController alloc]
                                                                initWithActivityItems:sharedObjects applicationActivities:nil];
            activityViewController.popoverPresentationController.sourceView = cell.container;
            [self presentViewController:activityViewController animated:YES completion:nil];
            break;
        }
        case 1:
        {
            
            if (@available(iOS 10.3, *)) {
                [SKStoreReviewController requestReview];
            } else {
                    // Fallback on earlier versions
            }
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Rate"];
            break;
        }
        case 2:
        {
            if (@available(iOS 10.0, *)) {
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://hardiklukhiiphone.home.blog"]] options:@{} completionHandler:nil];
            } else {
                    // Fallback on earlier versions
            }
            break;
        }
            
        default:
            NSLog(@"Item %i",(int)indexPath.row);
            break;
    }
}

@end
