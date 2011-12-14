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
            self.debate = (aPrice/aValue) * 10.0;
        }else{
            self.debate = 0;
        }
    }
    return self;
}


//- (void) encodeWithCoder: (NSCoder *)coder  {
//    
//    
//    
//    [coder encodeObject:_name forKey:@"name"];
//    [coder encodeObject:_director forKey:@"director"];
//    [coder encodeObject:_actorList forKey:@"actorList"];
//    [coder encodeInt:_price forKey:@"price"] ;
//    [coder encodeInt:_value forKey:@"value"] ;
//    [coder encodeObject:_image forKey:@"image"];
//
//        
//}
//
//- (id)initWithCoder:(NSCoder *)decoder{
//    
//    
//    if (self = [super init]) {
//        
//        self.name = [decoder decodeObjectForKey:@"name"]; 
//        self.director = [decoder decodeObjectForKey:@"director"];
//        self.actorList = [decoder decodeObjectForKey:@"actorList"];
//        self.price = [decoder decodeIntForKey:@"price"];
//        self.value = [decoder decodeIntForKey:@"value"];
//        self.image = [decoder decodeObjectForKey:@"image"];
//         
//    }
//    
//    
//    return self ;
//
//}


-(void)dealloc
{
    [_name release];
    [_image release];
    [_director release];
    [_actorList release];
    [super dealloc];
}

@end
