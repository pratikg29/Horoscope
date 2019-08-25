//
//  UINavigationController+MYTransition.m
//  Viva Campaign
//
//  Created by mac1 on 25/11/16.
//  Copyright © 2016 Social Infotech. All rights reserved.
//

#import "UIRefreshControl+DRefreshControl.h"
#import "UIScrollView+BottomRefreshControl.h"

@implementation UIRefreshControl(DRefreshControl)

/*
-(void) handleControlEvent:(UIControlEvents)event
                 withBlock:(ActionBlock) action
{
    _actionBlock = action;
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}

-(void) callActionBlock:(id)sender{
    _actionBlock();
}
*/

-(void)initDRefreshControl :(UITableView *)tblView
{
    /*// Initialize the refresh control.
     self.refreshControl = [[UIRefreshControl alloc] init];
     self.refreshControl.backgroundColor = kDefaultThemeColorTopbarLight;
     self.refreshControl.tintColor = [UIColor whiteColor];
     [self.refreshControl addTarget:self
     action:@selector(json_CurrentUpCommingEvent)
     forControlEvents:UIControlEventValueChanged];
     
     
     [self.tblview_list addSubview:self.refreshControl];
     self.tblview_list.alwaysBounceVertical = YES;*/
    
    //self.refreshControl = [UIRefreshControl new];
    self.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull down to reload!"];
    [self addTarget:self action:@selector(refreshTop) forControlEvents:UIControlEventValueChanged];
    [tblView addSubview:self];
    
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull up to reload!"];
    refreshControl.triggerVerticalOffset = 80.;
    [refreshControl addTarget:self action:@selector(refreshBottom) forControlEvents:UIControlEventValueChanged];
    tblView.bottomRefreshControl = refreshControl;

}


-(void)refreshTop
{
    NSLog(@"refreshTop");
}

-(void)refreshBottom
{
    /*if([_delegate respondsToSelector:@selector(DRefreshControlBottomClick)])
        [_delegate DRefreshControlBottomClick];*/
}
@end
