//
//  UINavigationController+MYTransition.m
//  Viva Campaign
//
//  Created by mac1 on 25/11/16.
//  Copyright © 2016 Social Infotech. All rights reserved.
//

#import "UITableView+MYTransition1.h"


@implementation UITableView(MYTransition1)
NSInteger animatedTill;

-(void)transition
{
   
}


- (void)reloadData:(BOOL)animated
{
    //[self.tblWall reloadData];
    animatedTill = 0;
    if (animated) {
        /*
         CATransition *animation = [CATransition animation];
         [animation setType:kCATransitionPush];
         [animation setSubtype:kCATransitionFromTop];
         [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
         [animation setFillMode:kCAFillModeBoth];
         [animation setDuration:.8];
         [[self layer] addAnimation:animation forKey:@"UITableViewReloadDataAnimationKey"];
         */
        
        
        //[self reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
        /*[UIView transitionWithView:self.tblWall
         duration:0.5f
         options:UIViewAnimationOptionTransitionCrossDissolve
         animations:^(void) {
         [self.tblWall reloadData];
         } completion:NULL];*/
        
    }
}
- (void)theMethodInWhichYouInsertARowInTheTableView
{
    /*//Add the object in the array which feeds the tableview
    NSString *newStringObject = @"New Object";
    [self.mutArrPosts addObject:newStringObject];
    
    [self beginUpdates];
    
    NSArray *paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:([self.mutArrPosts count] - 1) inSection:0]];
    [self insertRowsAtIndexPaths:paths withRowAnimation:NO];
    
    [self endUpdates];
    [self reloadData];
    [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:([self.mutArrPosts count] - 1) inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];*/
}


-(void) willDisplayCell:(UITableViewCell *) cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //row number on which you want to animate your view
    //row number could be either 0 or 1 as you are creating two cells
    //suppose you want to animate view on cell at 0 index
    //if(indexPath.row == 0) //check for the 0th index cell
    //{
    
    // access the view which you want to animate from it's tag
    /*UIView *myView = [cell.contentView viewWithTag:0];
     [myView setAlpha:0.0];
     //UIViewAnimationOptions randomType = (UIViewAnimationOptions) (arc4random() % (int) UIViewAnimationOptionTransitionFlipFromBottom);
     // apply animation on the accessed view
     [UIView animateWithDuration:0.5
     delay:0.3
     options:UIViewAnimationOptionCurveEaseInOut
     animations:^
     {
     [myView setAlpha:1.0];
     } completion:^(BOOL finished)
     {
     
     }];*/
    //}
    
    if (indexPath.row >= animatedTill)
    {
        CGRect myRect = [self rectForRowAtIndexPath:indexPath];
        
        //instead of 568, choose the origin of your animation
        cell.frame = CGRectMake(cell.frame.origin.x,
                                cell.frame.origin.y + self.layer.frame.size.height,
                                cell.frame.size.width,
                                cell.frame.size.height);
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            //instead of -30, choose how much you want the cell to get "under" the cell above
            cell.frame = CGRectMake(myRect.origin.x,
                                    myRect.origin.y ,
                                    myRect.size.width,
                                    myRect.size.height);
            
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.3 animations:^{
                cell.frame = myRect;
                animatedTill = indexPath.row;
            }];
            
        }];
    }
}


@end
