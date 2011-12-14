//
//  BookFilmController.h
//  Download
//
//  Created by  on 11-12-11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPTableViewController.h"

enum  {
    BOOK_FILM_NORMAL = 0,
    BOOK_FILM_SHOW = 1
    };

@class Cinema;
@interface BookFilmController : PPTableViewController
{
    NSInteger type;
    Cinema *cinema;
}

-(id)initWithType:(NSInteger)aType cinema:(Cinema *)aCinema;
@property(nonatomic,assign)NSInteger type;
@property(nonatomic,retain)Cinema *cinema;
@end
