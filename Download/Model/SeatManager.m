//
//  SeatManager.m
//  Download
//
//  Created by  on 11-12-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//



#import "SeatManager.h"
#import "Seat.h"
#import "Cinema.h"
#import "Film.h"
SeatManager *seatManager;
SeatManager * GlobalGetSeatManager()
{
    if (seatManager == nil) {
        seatManager = [[SeatManager alloc] init];
    }
    return seatManager;
}

@implementation SeatManager
@synthesize seatList = _seatList;


-(id)init
{
    self = [super init];
    if (self) {
        _seatList = [[NSMutableArray alloc] init];
    }
    return self;
}

+(SeatManager *)defaultManager
{
    return GlobalGetSeatManager();
}

-(void)addSeat:(Seat *)seat
{
    [_seatList addObject:seat];
}
-(void)removeSeat:(Seat *)seat
{
    if ([_seatList containsObject:seat]) {
        [_seatList removeObject:seat];
    }
}
-(void)removeAllSeats
{
    [_seatList removeAllObjects];
}


-(Seat *)getSeatByFilm:(Film *)film cinema:(Cinema *)cinema
{
    if (film == nil || cinema == nil) {
        return nil;
    }
    for (Seat *seat in _seatList)
    {
        if (seat.filmId == film.filmId && seat.cinemaId == cinema.cinemaId) {
            return seat;
        }
    }
    return nil;
}
-(void)addSelectedList:(NSArray *)list intoSeat:(Seat *)seat
{
    if (seat && seat.selectedSet) {
        [seat.selectedSet addObjectsFromArray:list];
    }
}

-(void)dealloc
{
    [_seatList release];
    [super dealloc];
}
@end
