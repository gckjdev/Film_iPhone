//
//  CinemaService.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CinemaService.h"
#import "Cinema.h"
#import "CinemaManager.h"

CinemaService *cinemaService;

CinemaService *GlobalGetCinemaService()
{
    if (cinemaService == nil) {
        cinemaService = [[CinemaService alloc] init];
    }
    return cinemaService;
}

@implementation CinemaService
-(void)updateCinemaListWithCity:(NSString *)city delegate:(id<CinemaServiceDelegate>) delegate
{
    Cinema *cinema = [[Cinema alloc] initWithCinemaId:1 name:@"上影联和电影城" address:@"江燕路108号燕汇广场4层" telNumber:@"020-89778118"];
    [[CinemaManager defaultManager] addCinema:cinema];
    [cinema release];
}
@end
