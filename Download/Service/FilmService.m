//
//  FilmService.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "FilmService.h"
#import "Film.h"
#import "FilmManager.h"

FilmService *service;

extern FilmService *GlobalGetFilmService()
{
    if (service == nil) {
        service = [[FilmService alloc] init];
    }
    return service;
}

@implementation FilmService


-(void)testDataInit
{  
    FilmManager *manager = [FilmManager defaultManager];
    [manager removeAllFilms];
    [manager addFilmWithName:@"丁丁历险记：独角兽号的秘密" imageName:@"1.jpg" director:@"史蒂文·斯皮尔伯格" 
                   actorList:[NSArray arrayWithObjects:@"杰米·贝尔",@"安迪·瑟金斯",@"西蒙·佩吉", nil] 
                       price:28 value:60];
}
-(void)updateFilmList
{

    [self testDataInit];
}

@end
