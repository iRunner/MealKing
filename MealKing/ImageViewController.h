//
//  ImageViewController.h
//  MealKing
//
//  Created by Jordan White on 9/14/14.
//  Copyright (c) 2014 Option White. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (assign, nonatomic) NSInteger indexNumber;

@end
