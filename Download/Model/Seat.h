//
//  Seat.h
//  Download
//
//  Created by  on 11-12-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Cinema;
@class Film;

@interface Seat : NSObject
{
    NSInteger size;
    NSMutableSet *selectedSet;
    NSInteger numberPerRow;
    Film *film;
    Cinema *cinema;
}

@property(nonatomic,retain) NSMutableSet *selectedSet;
@property(nonatomic,readonly) NSInteger size;
@property(nonatomic,readonly) NSInteger numberPerRow;
@property(nonatomic,retain) Film *film;
@property(nonatomic,retain) Cinema *cinema;
@property(nonatomic,readonly) NSInteger filmId;
@property(nonatomic,readonly) NSInteger cinemaId;


-(id)initWithSize:(NSInteger)aSize selectedSet:(NSSet *)set 
     numberPerRow:(NSInteger)numPerRow film:(Film *)aFilm 
           cinema:(Cinema *)aCinema;

@end
