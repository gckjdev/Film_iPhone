//
//  CinemaManager.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CinemaManager.h"
#import "Cinema.h"

CinemaManager *cinemaManager;
CinemaManager * GlobalGetCinemaManager()
{
    if (cinemaManager == nil) {
        cinemaManager = [[CinemaManager alloc] init];
    }
    return cinemaManager;
}

@implementation CinemaManager
@synthesize cinemaList = _cinemaList;

-(id)init
{
    self = [super init];
    if (self) {
        _cinemaList = [[NSMutableArray alloc] init];
    }
    return self;
}

+(CinemaManager *)defaultManager
{
    return GlobalGetCinemaManager();
}

-(void)addCinema:(Cinema *)cinema
{
    [_cinemaList addObject:cinema];
}
-(void)removeCinema:(Cinema *)cinema
{
    if ([_cinemaList containsObject:cinema]) {
        [_cinemaList removeObject:cinema];
    }
}

-(void)addCinemaWithName:(NSString *)name address:(NSString *)address 
               telNumber:(NSString*)telNumber
{
    Cinema *cinema = [[Cinema alloc]initWithCinemaId:[_cinemaList count] name:name address:address telNumber:telNumber];
    [_cinemaList addObject:cinema];
    [cinema release];
}

-(void)removeAllCinemas
{
    [_cinemaList removeAllObjects];
}

-(void)dealloc
{
    [_cinemaList release];
    [super dealloc];
}
@end
