//
//  ListTableView.m
//  MealKing
//
//  Created by Jordan White on 9/13/14.
//  Copyright (c) 2014 Option White. All rights reserved.
//

#import "ListTableView.h"

@implementation ListTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSLog(@"bg");
        UIImageView *whiteBG = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"white_bg.png"]];
        [self setBackgroundView:whiteBG];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
