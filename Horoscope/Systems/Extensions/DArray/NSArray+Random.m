//  NSArray+Random.m

//
//  Created by Darshit Mendapara on 2017/04/10.
//  Copyright © 2017 Socialinfotech. All rights reserved.
//


#import "NSArray+Random.h"

@implementation NSArray (Random)

- (id) randomObject
{
    if ([self count] == 0) {
        return nil;
    }
    return [self objectAtIndex: arc4random() % [self count]];
}

@end
