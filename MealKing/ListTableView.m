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

    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self changeBackground];
    }
    return self;
}

- (void)changeBackground {

    UIImageView *whiteBG = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"white_bg.png"]];
    self.backgroundColor = [UIColor clearColor];
    //[self setBackgroundView:whiteBG];
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
