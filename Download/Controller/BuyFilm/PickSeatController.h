//
//  PickSeatController.h
//  Download
//
//  Created by  on 11-12-13.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//


@protocol PickSeatDelegate <NSObject>

-(void)didPickSeat:(NSMutableSet *)selectedSeatSet;

@end

@class Film;
@class Cinema;
#import <UIKit/UIKit.h>
#import "PPViewController.h"
@interface PickSeatController :PPViewController
{
    NSInteger _filmCount;
    NSInteger _currentCount;
    Film *_film;
    Cinema *_cinema;
    NSMutableSet *_selectedSeatSet;
}

@property(nonatomic, assign)id<PickSeatDelegate>delegate;
@property(nonatomic, retain) Film *film;
@property(nonatomic, retain) Cinema *cinema;
@property(nonatomic, retain) NSMutableSet *selectedSeatSet;

-(id)initWithFilmCount:(NSInteger)filmCount;
-(id)initWithFilm:(Film *)film cinema:(Cinema *)cinema;
@end
