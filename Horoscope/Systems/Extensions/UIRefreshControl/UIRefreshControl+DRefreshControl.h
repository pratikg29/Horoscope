//
//  UINavigationController+MYTransition.h
//  Viva Campaign
//
//  Created by mac1 on 25/11/16.
//  Copyright © 2016 Social Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

static char const * const ActionBlockKey = "ActionBlockKey";

@interface UIRefreshControl(DRefreshControl)


@property (nonatomic, copy) void (^actionBlock)();

- (id)initWitActionBlock:(void (^)())actionBlock;

-(void)initDRefreshControl :(UITableView *)tblView;


@end
