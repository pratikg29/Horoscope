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
#import "PagerViewCell.h"


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
     self.array_detail = [[NSMutableArray alloc]initWithObjects:
                          @"As the first sign in the zodiac, the presence of Aries always marks the beginning of something energetic and turbulent. They are continuously looking for dynamic, speed and competition, always being the first in everything - from work to social gatherings. Thanks to its ruling planet Mars and the fact it belongs to the element of Fire (just like Leo and Sagittarius), Aries is one of the most active zodiac signs. It is in their nature to take action, sometimes before they think about it well.",
                          @"Practical and well-grounded, Taurus is the sign that harvests the fruits of labor. They feel the need to always be surrounded by love and beauty, turned to the material world, hedonism, and physical pleasures. People born with their Sun in Taurus are sensual and tactile, considering touch and taste the most important of all senses. Stable and conservative, this is one of the most reliable signs of the zodiac, ready to endure and stick to their choices until they reach the point of personal satisfaction.",
                          @"Expressive and quick-witted, Gemini represents two different personalities in one and you will never be sure which one you will face. They are sociable, communicative and ready for fun, with a tendency to suddenly get serious, thoughtful and restless. They are fascinated with the world itself, extremely curious, with a constant feeling that there is not enough time to experience everything they want to see.",
                          @"Deeply intuitive and sentimental, Cancer can be one of the most challenging zodiac signs to get to know. They are very emotional and sensitive, and care deeply about matters of the family and their home. Cancer is sympathetic and attached to people they keep close. Those born with their Sun in Cancer are very loyal and able to empathize with other people's pain and suffering.",
                          @"People born under the sign of Leo are natural born leaders. They are dramatic, creative, self-confident, dominant and extremely difficult to resist, able to achieve anything they want to in any area of life they commit to. There is a specific strength to a Leo and their king of the jungle status. Leo often has many friends for they are generous and loyal. Self-confident and attractive, this is a Sun sign capable of uniting different groups of people and leading them as one towards a shared cause, and their healthy sense of humor makes collaboration with other people even easier.",
                          @"Virgos are always paying attention to the smallest details and their deep sense of humanity makes them one of the most careful signs of the zodiac. Their methodical approach to life ensures that nothing is left to chance, and although they are often tender, their heart might be closed for the outer world. This is a sign often misunderstood, not because they lack the ability to express, but because they won’t accept their feelings as valid, true, or even relevant when opposed to reason. The symbolism behind the name speaks well of their nature, born with a feeling they are experiencing everything for the first time.",
                          @"People born under the sign of Libra are peaceful, fair, and they hate being alone. Partnership is very important for them, as their mirror and someone giving them the ability to be the mirror themselves. These individuals are fascinated by balance and symmetry, they are in a constant chase for justice and equality, realizing through life that the only thing that should be truly important to themselves in their own inner core of personality. This is someone ready to do nearly anything to avoid conflict, keeping the peace whenever possible",
                          @"Scorpio-born are passionate and assertive people. They are determined and decisive, and will research until they find out the truth. Scorpio is a great leader, always aware of the situation and also features prominently in resourcefulness. \n Scorpio is a Water sign and lives to experience and express emotions. Although emotions are very important for Scorpio, they manifest them differently than other water signs. In any case, you can be sure that the Scorpio will keep your secrets, whatever they may be.",
                          @"Curious and energetic, Sagittarius is one of the biggest travelers among all zodiac signs. Their open mind and philosophical view motivates them to wander around the world in search of the meaning of life. \n Sagittarius is extrovert, optimistic and enthusiastic, and likes changes. Sagittarius-born are able to transform their thoughts into concrete actions and they will do anything to achieve their goals.",
                          @"Capricorn is a sign that represents time and responsibility, and its representatives are traditional and often very serious by nature. These individuals possess an inner state of independence that enables significant progress both in their personal and professional lives. They are masters of self-control and have the ability to lead the way, make solid and realistic plans, and manage many people who work for them at any time. They will learn from their mistakes and get to the top based solely on their experience and expertise.",
                          @"Aquarius-born are shy and quiet , but on the other hand they can be eccentric and energetic. However, in both cases, they are deep thinkers and highly intellectual people who love helping others. They are able to see without prejudice, on both sides, which makes them people who can easily solve problems.",
                          @"Pisces are very friendly, so they often find themselves in a company of very different people. Pisces are selfless, they are always willing to help others, without hoping to get anything back. \n Pisces is a Water sign and as such this zodiac sign is characterized by empathy and expressed emotional capacity.",
                          nil];
    
    self.array_data = [[NSMutableArray alloc]initWithObjects:@"ic_aries", @"ic_taurus", @"ic_gemini", @"ic_cancer", @"ic_leo", @"ic_virgo", @"ic_libra", @"ic_scorpio", @"ic_sagittarius", @"ic_capricorn", @"ic_aquarius", @"ic_pisces", nil];
    self.array_zodiac = [[NSMutableArray alloc]initWithObjects:@"aries", @"taurus", @"gemini", @"cancer", @"leo", @"virgo", @"libra", @"scorpio", @"sagittarius", @"capricorn", @"aquarius", @"pisces", nil];
    self.array_title = [[NSMutableArray alloc]initWithObjects:@"Aries", @"Taurus", @"Gemini", @"Cancer", @"Leo", @"Virgo", @"Libra", @"Scorpio", @"Sagittarius", @"Capricorn", @"Aquarius", @"Pisces", nil];
    self.array_name = [[NSMutableArray alloc]initWithObjects:@"aries", @"taurus", @"gemini", @"cancer", @"leo", @"virgo", @"libra", @"scorpio", @"sagittarius", @"capricorn", @"aquarius", @"pisces", nil];
    
    [self.lblTitle initWithAppPropertiesSize:kDefaultFontSizeExtraLarge20 Type:DFONTMEDIUM];
    [self.lblTitle initWithAppPropertiesColorWhite];
    [self.pagerView registerClass:[FSPagerViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.pagerView.isInfinite = YES;
    self.pagerView.transformer = [[FSPagerViewTransformer alloc] initWithType:FSPagerViewTransformerTypeCoverFlow];
    self.pagerView.itemSize = CGSizeMake(_pagerView.frame.size.height/1.3, _pagerView.frame.size.height/1.3);
    self.pagerView.decelerationDistance = FSPagerViewAutomaticDistance;
    [self.pagerView setBackgroundColor:[UIColor clearColor]];
    [_txtView setText:_array_detail[0]];
    [_lblName setText:_array_name[0]];
    [_pagerView setClipsToBounds:FALSE];
    [_containerView.layer setCornerRadius:15];
    [_containerView setClipsToBounds:TRUE];
    _containerShaddowView.layer.shadowColor = [UIColor blackColor].CGColor;
    _containerShaddowView.layer.shadowRadius = 10;
    _containerShaddowView.layer.shadowOpacity = 0.7;
    [_containerShaddowView setClipsToBounds:FALSE];
}

- (void)rotatingAnimation: (UIImageView *)image duration: (float)duration from: (NSNumber*)From to: (NSNumber*)To {
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = From;
    animation.toValue = To;
    animation.duration = duration;
    animation.repeatCount = INFINITY;
    [image.layer addAnimation:animation forKey:@"SpinAnimation"];
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
//        [[GoogleAds sharedInstance] LoadAndShowFullScreenAd];
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

-(void)viewWillAppear:(BOOL)animated {
    [self rotatingAnimation:_img1 duration:40 from:[NSNumber numberWithFloat:0.0f] to:[NSNumber numberWithFloat: 2*M_PI]];
    [self rotatingAnimation:_img2 duration:70 from:[NSNumber numberWithFloat: 2*M_PI] to:[NSNumber numberWithFloat:0.0f]];
    [self rotatingAnimation:_img3 duration:60 from:[NSNumber numberWithFloat:0.0f] to:[NSNumber numberWithFloat: 2*M_PI]];
//    [[GoogleAds sharedInstance] LoadAndShowFullScreenAd];
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
            if (@available(iOS 10.3, *)) {
                [SKStoreReviewController requestReview];
            } else {
                    // Fallback on earlier versions
            }
        }
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
    [self.collectionView registerNib:[UINib nibWithNibName:@"MainCollectionViewCelliPad" bundle:nil] forCellWithReuseIdentifier:@"MainCollectionViewCell"];
}

#pragma mark - CollecionView

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
    cell.imgView.image = [UIImage imageNamed:[self.array_data objectAtIndex:indexPath.row]];
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
        return CGSizeMake(100 , 100);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PageMenuViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PageMenuViewController"];
    vc.strHoroName = [self.array_name objectAtIndex:indexPath.row];
    vc.strHoroTitle = [self.array_title objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - FSPagerViewDataSource

- (NSInteger)numberOfItemsInPagerView:(FSPagerView *)pagerView
{
    return self.array_data.count;
}

- (FSPagerViewCell *)pagerView:(FSPagerView *)pagerView cellForItemAtIndex:(NSInteger)index
{
    FSPagerViewCell * cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cell" atIndex:index];
    cell.imageView.image = [UIImage imageNamed:self.array_zodiac[index]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.imageView.clipsToBounds = YES;
    return cell;
}

#pragma mark - FSPagerViewDelegate

- (void)pagerView:(FSPagerView *)pagerView didSelectItemAtIndex:(NSInteger)index
{
    [pagerView deselectItemAtIndex:index animated:YES];
    [pagerView scrollToItemAtIndex:index animated:YES];
    PageMenuViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PageMenuViewController"];
    vc.strHoroName = [self.array_name objectAtIndex:index];
    vc.strHoroTitle = [self.array_title objectAtIndex:index];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pagerViewDidEndDecelerating:(FSPagerView *)pagerView {
    [_lblName setText:_array_name[pagerView.currentIndex]];
    [_txtView setText:_array_detail[pagerView.currentIndex]];
}


@end
