//
//  FilmManager.h
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>




@class Film;

@interface FilmManager : NSObject
{
    NSMutableArray *_filmList;
}

@property(nonatomic, retain)NSMutableArray *filmList;
+(FilmManager *)defaultManager;

-(void)addFilm:(Film *)film;
-(void)removeFilm:(Film *)film;
-(void)addFilmWithName:(NSString *)aFilmName imageName:(NSString *)aImageName
              director:(NSString *)aDirector actorList:(NSArray *)aActorList 
                 price:(CGFloat)aPrice value:(CGFloat)aValue;
-(void)removeAllFilms;
-(Film *)getFilmByCinema:(NSInteger)filmId;
@end

extern FilmManager *GlobalGetFilmManager();