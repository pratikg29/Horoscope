//
//  PageMenuViewController.h
//  Horoscope
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "init.h"

@interface PageMenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *listArr;
    NSMutableArray *urlArr;
    NSMutableArray *characteristicsArr;
}

@property BOOL isCharacteristics;
@property (strong, nonatomic) NSMutableArray *array_data;
@property (strong, nonatomic) CAPSPageMenu *pageMenu;

@property (strong, nonatomic) IBOutlet UIView *HeaderView;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UIView *ContainerView;

@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;

@property (strong, nonatomic) IBOutlet UITableView *table;

@property (strong, nonatomic) NSString *strHoroName;
@property (strong, nonatomic) NSString *strHoroTitle;

@end
