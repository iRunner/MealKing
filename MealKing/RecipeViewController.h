//
//  RecipeViewController.h
//  MealKing
//
//  Created by Jordan White on 9/13/14.
//  Copyright (c) 2014 Option White. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *foodPic;

@property (weak, nonatomic) IBOutlet UITableView *ingredientsList;
@property (weak, nonatomic) IBOutlet UITableView *stepsList;
@property (weak, nonatomic) IBOutlet UIView *infoView;


@end
