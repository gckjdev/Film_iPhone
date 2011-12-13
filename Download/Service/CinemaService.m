//
//  CinemaService.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CinemaService.h"
#import "Cinema.h"
#import "CinemaManager.h"
//#import "KeyForMapAbcApi.h"

CinemaService *cinemaService;

CinemaService *GlobalGetCinemaService()
{
    if (cinemaService == nil) {
        cinemaService = [[CinemaService alloc] init];
    }
    return cinemaService;
}


@implementation CinemaService


-(void)updateCinemaListWithCity:(NSString *)city delegate:(id<CinemaServiceDelegate>) delegate
{
    
//    _search = [MSearch MSearchWithKey:KEY delegate:self];
//    MPOISEARCHOPTIONS a;
//    
//    [_search PoiSearchByKeywords:@"电影院" City:city Options:a];
    
    Cinema *cinema = [[Cinema alloc] initWithCinemaId:1 name:@"上影联和电影城" address:@"江燕路108号燕汇广场4层" telNumber:@"020-89778118"];
    [[CinemaManager defaultManager] addCinema:cinema];
    [cinema release];
}




//-(void) showPoi:(MPOI *)poi
//{
//    
//    NSString *name = [self getStringWithUnichar:poi->cName 
//                                         length:sizeof(poi->cName)];
//    NSString *address = [self getStringWithUnichar:poi->cAddress 
//                                            length:sizeof(poi->cAddress)];
//    NSString *number = [self getStringWithUnichar:poi->cTel length:sizeof(poi->cTel)];
//    [[CinemaManager defaultManager] addCinemaWithName:name 
//                                              address:address telNumber:number];
//    
//    NSLog(@"%lf,%lf",poi->Y,poi->X);
//    NSLog(@"address: %@",[self getStringWithUnichar:poi->cAddress length:sizeof(poi->cAddress)]);
//    NSLog(@"name: %@",[self getStringWithUnichar:poi->cName length:sizeof(poi->cName)]);
//    NSLog(@"tel: %@",[self getStringWithUnichar:poi->cTel length:sizeof(poi->cTel)]);
//    NSLog(@"url: %@",[self getStringWithUnichar:poi->cUrl length:sizeof(poi->cUrl)]);
//    NSLog(@"cityCode: %@",[self getStringWithUnichar:poi->cCityCode length:sizeof(poi->cCityCode)]);
//    NSLog(@"imageId: %@",[self getStringWithUnichar:poi->cImageid length:sizeof(poi->cImageid)]);
//    
//    NSLog(@"****************************");
//}
//-(void) PoiSearchResponse:(MPOISEARCHRESULT*)info
//{
//    if (info == 0) {
//        return;
//    }
//    
//    for (int i = 0; i < info->lNum; ++i) {
//        [self showPoi:&info->pPois[i]];
//    }
//    
//}
 
@end
