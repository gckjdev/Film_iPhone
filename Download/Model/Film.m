//
//  Film.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "Film.h"

@implementation Film
@synthesize value = _value;
@synthesize debate = _debate;
@synthesize price = _price;
@synthesize actorList = _actorList;
@synthesize director = _director;
@synthesize name = _name;
@synthesize filmId = _filmId;
@synthesize image = _image;

-(id)initWithFilmId:(NSInteger)aFilmId name:(NSString *)aFilmName image:(UIImage*)aImage
           director:(NSString *)aDirector actorList:(NSArray *)aActorList 
              price:(CGFloat)aPrice value:(CGFloat)aValue;
{
    self = [super init];
    if (self) {
        self.filmId = aFilmId;
        self.name = aFilmName;
        self.director = aDirector;
        self.actorList = aActorList;
        self.price = aPrice;
        self.value = aValue;
        self.image = aImage;
        if (aValue > 0) {
            self.debate = aPrice/aValue;
        }else{
            self.debate = 0;
        }
    }
    return self;
}

-(void)dealloc
{
    [_name release];
    [_image release];
    [_director release];
    [_actorList release];
    [super dealloc];
}

@end
