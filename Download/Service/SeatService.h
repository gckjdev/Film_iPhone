//
//  SeatService.h
//  Download
//
//  Created by  on 11-12-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SeatServiceDelegate <NSObject>

@required
-(void)willUpdateSeatList;
-(void)didUpdatedSeatList:(NSInteger)errorCode;

@end

#import <Foundation/Foundation.h>
#import "CommonService.h"

@class Film;
@class Cinema;

@interface SeatService : CommonService
{
    
}
-(void)updateSeatListWithFilm:(Film *)film cinema:(Cinema *)cinema
                     delegate:(id<SeatServiceDelegate>) delegate;

@end
extern SeatService *GlobalGetSeatService();
