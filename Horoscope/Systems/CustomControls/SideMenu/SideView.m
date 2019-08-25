//
//  SideView.m
//  SideMenuTest
//
//  Created by April Lee on 2014/12/15.
//  Copyright (c) 2014年 april. All rights reserved.
//

#import "SideView.h"
#import "ViewController.h"
#import "SidemenuProfileCell.h"
#import "SidemenuItemsCell.h"
#import "UIImageView+DImageView.h"


@interface SideView()

@property (nonatomic,retain)UIViewController *superController;

@end

@implementation SideView


-(id)initWithFrame:(CGRect)frame andSuperView:(UIViewController *)superView
{
    self = [self initWithFrame:frame];
    
    if (self)
    {
        self.superController = superView;
        [self defaultArrayItem];
    }
    
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    
    UINib *sideNib = [UINib nibWithNibName:@"SideView" bundle:nil];
    NSArray *nibArr = [sideNib instantiateWithOwner:nil options:nil];
    
    self = (SideView *)[nibArr lastObject];
    
    if (self) {
        self.frame = frame;
        //[self initWithAppPropertiesTopbar];
        self.menuTableView.dataSource = self;
        self.menuTableView.delegate = self;
    }
    
    
    return self;
}

-(void)defaultArrayItem
{
    self.MenuNames = @[@"Daily Horoscope",@"Zodic Characteristic",@"Share App",@"Rate US",@"More App"];
    self.MenuImages = @[@"ic_horoscope",@"ic_zodic",@"ic_share",@"ic_rate",@"ic_more"];
    [self.menuTableView reloadData];
}


#pragma mark - MenuAction

-(void)openMenu
{
    
    if(MENU_SCROLL_isLeft)
    {
        self.hidden = NO;
        CGRect newFrame = self.frame;
        newFrame.origin.x = -D_SCREEN_WIDTH;
        self.frame = newFrame;
        
        
        //CGRect newFrame = self.frame;
        float a = 0;
        newFrame.origin.x = a;
        NSLog(@"Data=%f",a);
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.frame = newFrame;
                         }];
    }
    else
    {
        self.hidden = NO;
        CGRect newFrame = self.frame;
        float a= D_SCREEN_WIDTH - MENU_WIDTH;
        if(a<0)
        {
            a=-a;
        }
        
        newFrame.origin.x = a;
        NSLog(@"Data=%f",a);
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.frame = newFrame;
                         }];
    }
    
}

-(void)closeMenu
{
    if(MENU_SCROLL_isLeft)
    {
        CGRect newFrame = self.frame;
        newFrame.origin.x = -D_SCREEN_WIDTH;
        NSLog(@"frame===%@",NSStringFromCGRect(self.frame));
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.frame = newFrame;
                             
                         } completion:^(BOOL finished) {
                             self.hidden = YES;
                         }];
    }
    else
    {
        CGRect newFrame = self.frame;
        newFrame.origin.x = D_SCREEN_WIDTH;
        
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.frame = newFrame;
                             
                         } completion:^(BOOL finished) {
                             self.hidden = YES;
                         }];
    }
    
}

-(void)closed
{
    self.hidden = YES;
}

#pragma mark - tableView DataSoure

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }
    else
    {
        return self.MenuNames.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0 )
    {
            SidemenuProfileCell *cell = (SidemenuProfileCell *)[tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
            
            if(cell == nil)
            {
                NSArray *nib;
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    nib= [[NSBundle mainBundle]loadNibNamed:@"SidemenuProfileCell" owner:self options:nil];
                }
                else
                {
                    nib= [[NSBundle mainBundle]loadNibNamed:@"SidemenuProfileCelliPad" owner:self options:nil];
                }
                
                cell = [nib objectAtIndex:0];
            }
        
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return cell;
    
    }
    else
    {
        SidemenuItemsCell *cell = (SidemenuItemsCell *)[tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
        
        if(cell == nil)
        {
            NSArray *nib;
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                nib = [[NSBundle mainBundle]loadNibNamed:@"SidemenuItemsCell" owner:self options:nil];
            }
            else
            {
                nib = [[NSBundle mainBundle]loadNibNamed:@"SidemenuItemsCelliPad" owner:self options:nil];
    
            }
            cell = [nib objectAtIndex:0];
        }
        
        NSLog(@"%@",[self.MenuNames objectAtIndex:indexPath.row]);
        cell.lbl_name.text = [self.MenuNames objectAtIndex:indexPath.row];
        cell.imgView_icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.MenuImages[indexPath.row]]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            return 150;
        }
        else
        {
            return 250;
        }
    }
    else
    {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            return 50;
        }
        else
        {
            return 70;
        }
    }
}

#pragma mark - tableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    if(indexPath.section==0)
    {
            
    }
    else
    {
        switch (indexPath.row)
        {
            case 0:
            {
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
                {
                    UITabBarController *addinvController = [self.superController.storyboard instantiateViewControllerWithIdentifier:@"iPadViewController"];
                    addinvController.selectedIndex = 0;
                    [self.superController.navigationController pushViewController:addinvController animated:YES];
                    
                }
                else
                {
                    UITabBarController *addinvController = [self.superController.storyboard instantiateViewControllerWithIdentifier:@"UITabBarController"];
                    addinvController.selectedIndex = 0;
                    [self.superController.navigationController pushViewController:addinvController animated:YES];
                }
                break;
                    
            }
            case 1:
            {
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
                {
                    UITabBarController *addinvController = [self.superController.storyboard instantiateViewControllerWithIdentifier:@"iPadViewController"];
                    addinvController.selectedIndex = 1;
                    [self.superController.navigationController pushViewController:addinvController animated:YES];
                    
                }
                else
                {
                    UITabBarController *addinvController = [self.superController.storyboard instantiateViewControllerWithIdentifier:@"UITabBarController"];
                    addinvController.selectedIndex = 1;
                    [self.superController.navigationController pushViewController:addinvController animated:YES];
                }
                break;
                    
            }
            case 2:
            {
                    
                NSString *sharedMsg=[NSString stringWithFormat:@"https://itunes.apple.com/us/app/daily-horoscope-zodiac-sings/id1449032380?ls=1&mt=8"];
                NSArray* sharedObjects=[NSArray arrayWithObjects:sharedMsg, nil];
                UIActivityViewController *activityViewController = [[UIActivityViewController alloc]
                                                                    initWithActivityItems:sharedObjects applicationActivities:nil];
                activityViewController.popoverPresentationController.sourceView = self.superview;
                [self.superController presentViewController:activityViewController animated:YES completion:nil];
                break;
            }
            case 3:
            {
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1436973436&onlyLatestVersion=false&pageNumber=0&sortOrdering=1&type=Purple+Software"]] options:@{} completionHandler:nil];
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Rate"];
                 break;
            }
            case 4:
            {
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/us/developer/pankaj-bhalala/id1447853943"]] options:@{} completionHandler:nil];
                break;
            }
                
            default:
                NSLog(@"Item %i",(int)indexPath.row);
                break;
                    
        }
            
    }

}


@end
