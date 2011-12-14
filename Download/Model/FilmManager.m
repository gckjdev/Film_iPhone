//
//  FilmManager.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "FilmManager.h"
#import "Film.h"
FilmManager *filmManager;
FilmManager * GlobalGetFilmManager()
{
    if (filmManager == nil) {
        filmManager = [[FilmManager alloc] init];
    }
    return filmManager;
}

@implementation FilmManager
@synthesize filmList = _filmList;

-(id)init
{
    self = [super init];
    if (self) {
        _filmList = [[NSMutableArray alloc] init];
    }
    return self;
}

+(FilmManager *)defaultManager
{
    return GlobalGetFilmManager();
}

-(void)addFilm:(Film *)film
{
    [_filmList addObject:film];
}

-(void)removeFilm:(Film *)film
{
    if ([_filmList containsObject:film]) {
        [_filmList removeObject:film];
    }
}

-(void)addFilmWithName:(NSString *)aFilmName imageName:(NSString *)aImageName
              director:(NSString *)aDirector actorList:(NSArray *)aActorList 
                 price:(CGFloat)aPrice value:(CGFloat)aValue
{
    Film *film = [[Film alloc] initWithFilmId:[_filmList count] 
                                         name:aFilmName 
                                        image:[UIImage imageNamed:aImageName] 
                                        director:aDirector 
                                        actorList:aActorList 
                                        price:aPrice 
                                        value:aValue];
    [_filmList addObject:film];
    [film release];
    
    
    
}

-(void)removeAllFilms
{
    [_filmList removeAllObjects];
}

-(Film *)getFilmByCinema:(NSInteger)filmId
{
    for (Film *film in _filmList) {
        if (film.filmId == filmId) {
            return film;
        }
    }
    return nil;
}

-(void)dealloc
{
    [_filmList release];
    [super dealloc];
}
@end
