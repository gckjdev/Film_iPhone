//
//  CinemaManager.h
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Cinema;
@interface CinemaManager : NSObject
{
    NSMutableArray *_cinemaList;
}

@property(nonatomic, retain)NSMutableArray *cinemaList;
+(CinemaManager *)defaultManager;
-(void)addCinema:(Cinema *)cinema;
-(void)removeCinema:(Cinema *)cinema;
@end
extern CinemaManager *GlobalGetCinemaManager();