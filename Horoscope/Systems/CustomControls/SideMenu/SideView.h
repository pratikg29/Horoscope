//
//  SideView.h
//  SideMenuTest
//
//  Created by April Lee on 2014/12/15.
//  Copyright (c) 2014年 april. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "CoverView.h"
#import "UIView+DView.h"
#import "Extensions.h"

#define MENU_SCROLL_isLeft YES
//#define MENU_SCROLL @"right"

/*
 
 
 #define SCREENFRAME_WIDTH [[UIScreen mainScreen]applicationFrame].size.width
 #define SCREENFRAME_HEIGHT [[UIScreen mainScreen]applicationFrame].size.height
 
 #define SCREENFRAME_Y [[UIScreen mainScreen]applicationFrame].origin.y
 
 #define MENU_WIDTH  SCREENFRAME_WIDTH*4/5
 
 #define SIDEMENU_FRAME CGRectMake(SCREENFRAME_WIDTH, 0, MENU_WIDTH, SCREENFRAME_HEIGHT+20)
 
 */

@interface SideView : UIView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain)IBOutlet UITableView *menuTableView;
@property (nonatomic,copy) NSArray *MenuNames,*MenuImages;


-(id)initWithFrame:(CGRect)frame andSuperView:(UIViewController *)superView;

-(void)openMenu;
-(void)closeMenu;
-(void)closed;

@end
