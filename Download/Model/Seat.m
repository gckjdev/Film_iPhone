//
//  Seat.m
//  Download
//
//  Created by  on 11-12-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "Seat.h"
#import "Film.h"
#import "Cinema.h"

@implementation Seat
@synthesize numberPerRow;
@synthesize selectedSet;
@synthesize size;
@synthesize film;
@synthesize cinema;
@synthesize cinemaId;
@synthesize filmId;

-(id)initWithSize:(NSInteger)aSize selectedSet:(NSSet *)set 
     numberPerRow:(NSInteger)numPerRow film:(Film *)aFilm 
           cinema:(Cinema *)aCinema

{
    self = [super init];
    if (self) {
        self.selectedSet = [[NSMutableSet alloc] initWithSet:set];
        self.cinema = aCinema;
        self.film = aFilm;
        size = aSize;
        numberPerRow = numPerRow;
        if (numberPerRow <= 0) {
            numberPerRow = 6;
        }
    }
    return self;
}

-(void)dealloc
{
    [selectedSet release];
    [film release];
    [cinema release];
    [super release];
}

-(NSInteger)filmId
{
    if (film) {
        return film.filmId;
    }
    return -1;
}

-(NSInteger)cinemaId
{
    if (cinema) {
        return cinema.cinemaId;
    }
    return -1;
}

@end
