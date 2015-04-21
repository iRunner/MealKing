//
//  recipeCell.h
//  MealKing
//
//  Created by Abdullah Abdurrah on 9/13/14.
//  Copyright (c) 2014 Option White. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface recipeCell : UICollectionViewCell

@property (strong, atomic) IBOutlet UIImageView *mainPic;
@property (strong, atomic) IBOutlet UILabel *name;
@property (weak, atomic) IBOutlet UILabel *timeLabel;
@property  UILabel *time;

@property (strong, atomic) NSDictionary *recipe;


@end
