//
//  FilmService.h
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilmService : NSObject
{
    NSArray *nameList;
    NSArray *directorList;
    NSArray *actorList;
    NSArray *imageUrlList;
    NSArray *priceList;
    
    
    
}
@property (nonatomic, assign) id delegate;

@property (nonatomic, retain) NSMutableArray *data;

-(void)updateFilmList;
- (void)readWritePlist : (NSArray*)filmList ;



@end
extern FilmService *GlobalGetFilmService();