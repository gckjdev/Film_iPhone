//
//  SeatManager.h
//  Download
//
//  Created by  on 11-12-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Seat;
@class Film;
@class Cinema;

@interface SeatManager : NSObject
{
    NSMutableArray *_seatList;
}

@property(nonatomic, retain)NSMutableArray *seatList;
+(SeatManager *)defaultManager;
-(void)addSeat:(Seat *)seat;
-(void)removeSeat:(Seat *)seat;
-(void)removeAllSeats;
-(Seat *)getSeatByFilm:(Film *)film cinema:(Cinema *)cinema;
-(void)addSelectedList:(NSArray *)list intoSeat:(Seat *)seat;

@end
extern SeatManager *GlobalGetSeatManager();