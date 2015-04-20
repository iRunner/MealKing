//
//  Fetcher.m
//  MealKing
//
//  Created by Jordan White on 9/14/14.
//  Edited by Abdullah Sahyouni
//  Copyright (c) 2014 Option White. All rights reserved.
//

#import "Fetcher.h"


@implementation Fetcher


- (id) init
{
 
    self = [super init];
    if (self) {
        
        
    }
    return self;
    
}


- (NSArray*)fetchFeedWith:(NSString *)inputURL {
    
    __block NSArray *recipes = nil;
    
    
    NSURL *URL = [NSURL URLWithString:inputURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler:
     ^(NSURLResponse* response, NSData* data, NSError* connectionError){
         NSLog(@"data is kinda here");
         //the same as calling self, but its a safety to make sure self hasn't been set to nil
         //since this is inside of a 'block'
         recipes = [self extractData: data];
         NSLog(@"%@", recipes);
         
     }];
    return recipes;
}

#pragma mark - extraction

- (NSArray *) extractData: (NSData*) someData  {
    
    NSArray *allCourses = [NSJSONSerialization JSONObjectWithData:someData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"The data is downloaded");
    
    for(NSDictionary *item in allCourses) {
        NSString *image_url = [item objectForKey:@"main_image"];
        [item setValue:[self fetchImageWith:image_url] forKey:@"main_image"];
    }
    
   
    
    return allCourses;
}


- (UIImage *) fetchImageWith:(NSString *)inputURL {
    __block UIImage *image = nil;
    
    NSURL *URL = [NSURL URLWithString:inputURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler:
     ^(NSURLResponse* response, NSData* data, NSError* connectionError){
         //the same as calling self, but its a safety to make sure self hasn't been set to nil
         //since this is inside of a 'block'
         image = [UIImage imageWithData:data];
         
         //label.hidden = YES;
     }];
    return image;
}




@end
