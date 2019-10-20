//
//  ViewController.m
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "ViewController.h"
#import "MainCollectionViewCell.h"
#import "PageMenuViewController.h"


@interface ViewController ()
{
    NSMutableArray *alertArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initKit];
    [self doInitialSettings];
    [self setupSidemenu];
    [self getAdsID];
    [self ShowAlertDialog];
    // Do any additional setup after loading the view.
}

-(void)initKit
{
    self.array_data = [[NSMutableArray alloc]initWithObjects:@"ic_aries", @"ic_taurus", @"ic_gemini", @"ic_cancer", @"ic_leo", @"ic_virgo", @"ic_libra", @"ic_scorpio", @"ic_sagittarius", @"ic_capricorn", @"ic_aquarius", @"ic_pisces", nil];
    self.array_title = [[NSMutableArray alloc]initWithObjects:@"Aries", @"Taurus", @"Gemini", @"Cancer", @"Leo", @"Virgo", @"Libra", @"Scorpio", @"Sagittarius", @"Capricorn", @"Aquarius", @"Pisces", nil];
    self.array_name = [[NSMutableArray alloc]initWithObjects:@"aries", @"taurus", @"gemini", @"cancer", @"leo", @"virgo", @"libra", @"scorpio", @"sagittarius", @"capricorn", @"aquarius", @"pisces", nil];
    
    [self.lblTitle initWithAppPropertiesSize:kDefaultFontSizeExtraLarge20 Type:DFONTMEDIUM];
    [self.lblTitle initWithAppPropertiesColorWhite];
}

-(void)getAdsID
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:[[NSBundle mainBundle] bundleIdentifier] forKey:@"package_name"];
    [WebService postWithUrlString:@"http://managemyappzone.online/iphone/api/ads" parameters:dict progress:nil success:^(NSDictionary *responce) {
        
        NSLog(@"%@",responce);
        [[NSUserDefaults standardUserDefaults] setObject:[responce valueForKeyPath:@"data.google_app_id"] forKey:@"AppID"];
        [[NSUserDefaults standardUserDefaults] setObject:[responce valueForKeyPath:@"data.google_banner"] forKey:@"AdsBanner"];
        //        [[NSUserDefaults standardUserDefaults] setObject:[responce valueForKeyPath:@"data.google_interstitial"] forKey:@"AdsInterstital"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        GAdInterstitialKey = [responce valueForKeyPath:@"data.google_interstitial"];
        
        [self initWithAds];
        [[GoogleAds sharedInstance] LoadAndShowFullScreenAd];
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

-(void)viewWillAppear:(BOOL)animated {
    [[GoogleAds sharedInstance] LoadAndShowFullScreenAd];
}

-(void)setupSidemenu
{
    [self addCoverView];
    [self addSideMenuView];
}

#pragma mark - add SideMenu & CoverView

-(void)addSideMenuView
{
    if (sideView == nil) {
        
        sideView = [[SideView alloc]initWithFrame:SIDEMENU_FRAME andSuperView:self];
    }
    
    [self.view addSubview:sideView];
}

-(void)addCoverView
{
    bgCoverView = [[CoverView alloc]initWithFrame:self.view.frame];
    
    bgCoverView.hidden = YES;
    bgCoverView.delegate = self;
    
    [self.view addSubview:bgCoverView];
}

#pragma mark - CoverViewDelegate

-(void)respondToTapGestureRecognizer
{
    [sideView closeMenu];
    bgCoverView.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:NO];
    [sideView closed];
    bgCoverView.hidden = YES;
}

- (IBAction)btnMenu:(id)sender
{
    [sideView openMenu];
    bgCoverView.hidden = NO;
}

-(void)ShowAlertDialog
{
    NSString *showPopup = [[NSUserDefaults standardUserDefaults] valueForKey:@"POPUP"];
    if ([showPopup isEqualToString:@"yes"]) {
        
        self.isRate = [[NSUserDefaults standardUserDefaults] boolForKey:@"Rate"];
        
        if (self.isRate == YES) {
            
        }
        else if (self.isRate == NO)
        {
            [self customAlertShow];
        }
    }
}


-(void)customAlertShow
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Rate Daily Horoscope" message:@"If you enjoy using Daily Horoscope, would you mind taking a moment to rate it? It won't take more than a minute.Thanks for your support!" delegate:self cancelButtonTitle:@"No ,Thanks" otherButtonTitles:@"Rate It Now", @"Remind me Later", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            NSLog(@"That was button at index 0");
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Rate"];
            break;
            
        case 1:
            NSLog(@"That was button at index 1");
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1436566594&onlyLatestVersion=false&pageNumber=0&sortOrdering=1&type=Purple+Software"]] options:@{} completionHandler:nil];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Rate"];
            break;
            
        case 2:
            NSLog(@"That was button at index 2");
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"Rate"];
            break;
            
        default:
            break;
    }
    
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

-(void)doInitialSettings {
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MainCollectionViewCell"];
//    [self.collectionView registerNib:[UINib nibWithNibName:@"MainCollectionViewCelliPad" bundle:nil] forCellWithReuseIdentifier:@"MainCollectionViewCell"];
}

#pragma mark - CollecionView

-(void)reloadCollectionView
{
    [self.collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSInteger numOfSections = 1;
    return numOfSections;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array_name.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainCollectionViewCell" forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[self.array_name objectAtIndex:indexPath.row]]];
    cell.lblTitle.text = [self.array_title objectAtIndex:indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        return CGSizeMake(200 , 200);
    }
    else
    {
//        return CGSizeMake(150 , 150);
        return CGSizeMake(collectionView.frame.size.width/3 , collectionView.frame.size.width/3);
    }
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PageMenuViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PageMenuViewController"];
    vc.strHoroName = [self.array_name objectAtIndex:indexPath.row];
    vc.strHoroTitle = [self.array_title objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
