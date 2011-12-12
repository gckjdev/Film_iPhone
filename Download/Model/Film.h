//
//  Film.h
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Film : NSObject
{
    NSString *_name;
    NSString *_director;
    NSArray *_actorList;
    UIImage *_image;
    CGFloat _price;
    CGFloat _debate;
    CGFloat _value;
    NSInteger _filmId;
}

@property(nonatomic, retain)NSString *name;
@property(nonatomic, retain)NSString *director;
@property(nonatomic, retain)NSArray *actorList;
@property(nonatomic, assign)CGFloat price;
@property(nonatomic, assign)CGFloat value;
@property(nonatomic, assign)CGFloat debate;
@property(nonatomic, assign)NSInteger filmId;
@property(nonatomic, retain)UIImage *image;

-(id)initWithFilmId:(NSInteger)aFilmId name:(NSString *)aFilmName image:(UIImage*)aImage
           director:(NSString *)aDirector actorList:(NSArray *)aActorList 
              price:(CGFloat)aPrice value:(CGFloat)aValue;
@end
