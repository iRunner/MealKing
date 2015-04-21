//
//  collectionViewController.m
//  MealKing
//
//  Created by Abdullah Abdurrah on 9/13/14.
//  Copyright (c) 2014 Option White. All rights reserved.
//

#import "collectionViewController.h"
#import "RecipeViewController.h"


@interface collectionViewController ()

@property NSArray *images;
@property NSArray *names;

@end

@implementation collectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.myApp = [[UIApplication sharedApplication] delegate];
    
    
    [self.dataIndecator startAnimating];
    self.dataIndecator.hidesWhenStopped = YES;
    
    NSString *url = [self.myApp.settings objectForKey:@"recipesurl"];
    
    [self fetchFeedWith:url andIndecator: self.dataIndecator];
 
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.recipes count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    

    
    recipeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:recipeCellIdentifier forIndexPath:indexPath];
    
    
    cell.mainPic.image = [[self.recipes objectAtIndex:indexPath.section] objectForKey:@"main_image"];
    
    cell.name.text = [[self.recipes objectAtIndex:indexPath.section] objectForKey:@"title"];
    
    
    cell.timeLabel.text = [NSString stringWithFormat:@"%@", [[self.recipes objectAtIndex:indexPath.section] objectForKey:@"time_minutes"]];
    
    return cell;
}
                    
                    
                    

- (NSArray*)fetchFeedWith:(NSString *)inputURL andIndecator: (UIActivityIndicatorView *)indecator {
    
    __block NSArray *recipes = nil;
    
    
    NSURL *URL = [NSURL URLWithString:inputURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler:
     ^(NSURLResponse* response, NSData* data, NSError* connectionError){
         
         //the same as calling self, but its a safety to make sure self hasn't been set to nil
         //since this is inside of a 'block'
         recipes = [self extractData: data];
         
         [indecator performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
         
         self.recipes = recipes;
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self.recipeCollectionView reloadData];
             
         });
         
     }];
    return recipes;
}
                    
#pragma mark - extraction
                    
- (NSArray *) extractData: (NSData*) someData  {
    
    NSArray *allCourses = [NSJSONSerialization JSONObjectWithData:someData options:NSJSONReadingMutableContainers error:nil];
    
    for(NSDictionary *item in allCourses) {
        NSString *image_url = [item objectForKey:@"main_image"];
        [item setValue:[self fetchImageWith:image_url] forKey:@"main_image"];
    }
    
    
    
    return allCourses;
}


- (UIImage *) fetchImageWith:(NSString *)inputURL {
    
    NSURL *URL = [NSURL URLWithString:inputURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSError *error = nil;
    NSURLResponse* response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    
    
    
    return [UIImage imageWithData:data];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailRecipeSegue"]) {
        
        NSIndexPath *index = [[self.recipeCollectionView indexPathsForSelectedItems] lastObject];
        RecipeViewController *dest = (RecipeViewController *)[segue destinationViewController];
        
        dest.recipe = [self.recipes objectAtIndex:index.section];
        
        //self.recipeCollectionView in
        
    }
}

@end
