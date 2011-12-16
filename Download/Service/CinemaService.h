//
//  CinemaService.h
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

@protocol CinemaServiceDelegate <NSObject>

@required
-(void)willUpdateCinemaList;
-(void)didUpdatedCinemaList:(NSInteger)errorCode;

@end

#import <Foundation/Foundation.h>
//#import "MSearch.h"
#import "CommonService.h"

@interface CinemaService : CommonService//<MSearchDelegate>
{
 //   MSearch *_search;
}

@property(nonatomic,retain) NSMutableArray *data ;
-(void)updateCinemaListWithCity:(NSString *)city delegate:(id<CinemaServiceDelegate>) delegate;

@end
extern CinemaService *GlobalGetCinemaService();