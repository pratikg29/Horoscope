//
//  UINavigationController+MYTransition.m
//  Viva Campaign
//
//  Created by mac1 on 25/11/16.
//  Copyright © 2016 Social Infotech. All rights reserved.
//

#import "UILabel+MYLabel.h"


@implementation UILabel(MYLabel)

- (void)buildAgreeTextViewFromString:(NSString *)localizedString
{
    // 1. Split the localized string on the # sign:
    NSArray *localizedStringPieces = [localizedString componentsSeparatedByString:@"#"];
    
    // 2. Loop through all the pieces:
    NSUInteger msgChunkCount = localizedStringPieces ? localizedStringPieces.count : 0;
    CGPoint topRight = CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y);
    //CGPoint bottomRight = CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y + self.frame.size.height);
    CGPoint wordLocation = topRight;
    for (NSUInteger i = 0; i < msgChunkCount; i++)
    {
        NSString *chunk = [localizedStringPieces objectAtIndex:i];
        if ([chunk isEqualToString:@""])
        {
            continue;     // skip this loop if the chunk is empty
        }
        
        // 3. Determine what type of word this is:
        BOOL isTermsOfServiceLink = [chunk hasPrefix:@"<ts>"];
        BOOL isPrivacyPolicyLink  = [chunk hasPrefix:@"<pp>"];
        BOOL isLink = (BOOL)(isTermsOfServiceLink || isPrivacyPolicyLink);
        
        // 4. Create label, styling dependent on whether it's a link:
        //UILabel *label = [[UILabel alloc] init];
        self.font = [UIFont systemFontOfSize:15.0f];
        self.text = chunk;
        self.userInteractionEnabled = isLink;
        
        if (isLink)
        {
            self.textColor = [UIColor blueColor];
            self.highlightedTextColor = [UIColor yellowColor];
            
            // 5. Set tap gesture for this clickable text:
            SEL selectorAction = isTermsOfServiceLink ? @selector(tapOnTermsOfServiceLink:) : @selector(tapOnPrivacyPolicyLink:);
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                         action:selectorAction];
            [self addGestureRecognizer:tapGesture];
            
            // Trim the markup characters from the label:
            if (isTermsOfServiceLink)
                self.text = [self.text stringByReplacingOccurrencesOfString:@"<ts>" withString:@""];
            if (isPrivacyPolicyLink)
                self.text = [self.text stringByReplacingOccurrencesOfString:@"<pp>" withString:@""];
        }
        else
        {
            self.textColor = [UIColor lightGrayColor];
        }
        
        // 6. Lay out the labels so it forms a complete sentence again:
        
        // If this word doesn't fit at end of this line, then move it to the next
        // line and make sure any leading spaces are stripped off so it aligns nicely:
        
        [self sizeToFit];
        
        if (self.frame.size.width < wordLocation.x + self.bounds.size.width)
        {
            wordLocation.x = 0.0;                       // move this word all the way to the left...
            wordLocation.y += self.frame.size.height;  // ...on the next line
            
            // And trim of any leading white space:
            NSRange startingWhiteSpaceRange = [self.text rangeOfString:@"^\\s*"
                                                                options:NSRegularExpressionSearch];
            if (startingWhiteSpaceRange.location == 0)
            {
                self.text = [self.text stringByReplacingCharactersInRange:startingWhiteSpaceRange
                                                                 withString:@""];
                [self sizeToFit];
            }
        }
        
        // Set the location for this label:
        self.frame = CGRectMake(wordLocation.x,
                                 wordLocation.y,
                                 self.frame.size.width,
                                 self.frame.size.height);
        // Show this label:
        //[self.view addSubview:label];
        
        // Update the horizontal position for the next word:
        wordLocation.x += self.frame.size.width;
    }
}
- (void)tapOnTermsOfServiceLink:(UITapGestureRecognizer *)tapGesture
{
    if (tapGesture.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"User tapped on the Terms of Service link");
    }
}


- (void)tapOnPrivacyPolicyLink:(UITapGestureRecognizer *)tapGesture
{
    if (tapGesture.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"User tapped on the Privacy Policy link");
    }
}

@end
