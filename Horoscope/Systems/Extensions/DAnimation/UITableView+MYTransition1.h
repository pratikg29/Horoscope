//
//  UINavigationController+MYTransition.h
//  Viva Campaign
//
//  Created by mac1 on 25/11/16.
//  Copyright © 2016 Social Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface UITableView(MYTransition1)



- (void)reloadData:(BOOL)animated;
- (void)theMethodInWhichYouInsertARowInTheTableView;
-(void) willDisplayCell:(UITableViewCell *) cell forRowAtIndexPath:(NSIndexPath *)indexPath;
@end
