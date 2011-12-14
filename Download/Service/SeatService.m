//
//  SeatService.m
//  Download
//
//  Created by  on 11-12-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//
#import "SeatService.h"
#import "Seat.h"
#import "SeatManager.h"

SeatService *seatService;

SeatService *GlobalGetSeatService()
{
    if (seatService == nil) {
        seatService = [[SeatService alloc] init];
    }
    return seatService;
}


@implementation SeatService


-(void)updateSeatListWithFilm:(Film *)film cinema:(Cinema *)cinema
                     delegate:(id<SeatServiceDelegate>) delegate
{
    if (film == nil || cinema ==nil) {
        return;
    }
    SeatManager *manager = [SeatManager defaultManager];
    Seat *seat = [manager getSeatByFilm:film cinema:cinema];
    if (!seat) {
        NSMutableSet *set = [[NSMutableSet alloc] init];
        
        for (int i = 0; i < 60; ++ i) {
            if (rand() % 3 == 0) {
                NSNumber *number = [NSNumber numberWithInt:i];
                [set addObject:number];
            }
        }

        seat = [[Seat alloc]initWithSize:60 selectedSet:set numberPerRow:6 film:film cinema:cinema];
        [manager addSeat:seat];
        [set release];
    }
}
@end
