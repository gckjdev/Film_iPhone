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
    
    CinemaManager *manager = [CinemaManager defaultManager];
    [manager addCinemaWithName:@"上影联和电影城" address:@"江燕路108号燕汇广场4层" telNumber:@"020-89778118"];
    
    [manager addCinemaWithName:@"华南影都" address:@"环市西路133路华南影都D区2层" telNumber:@"020-28340088"];
    
    [manager addCinemaWithName:@"青宫电影城" address:@"北京路动感328" telNumber:@"020-83328233  020-83329918  020-83322688"];
    
    [manager addCinemaWithName:@"榕泉影剧院" address:@"文明路65号" telNumber:@"020-83372923"];
    
    
    [manager addCinemaWithName:@"羊城电影院" address:@"长堤大马路248号" telNumber:@"020-83347984"];
    
    [manager addCinemaWithName:@"五月花电影城" address:@"中山五路68号五月花商业广场6层" telNumber:@"020-83330836;020-83331003;020-83337366"];
    
    [manager addCinemaWithName:@"太古仓电影库" address:@"革新路124之6-7" telNumber:@"020-84309788"];
    
    [manager addCinemaWithName:@"上影联和电影城" address:@"江燕路108号燕汇广场4层" telNumber:@"020-89778118"];
    
    
    [manager addCinemaWithName:@"飞扬影城(天河城)" address:@"天河路208号天河城4层" telNumber:@"020-85590336;020-85596002;020-85591013"];
    
    [manager addCinemaWithName:@"中影火山湖电影城" address:@"农林下路4-6号锦轩现代城4层" telNumber:@"020-87623868"];
    
    [manager addCinemaWithName:@"员村文化宫电影院库" address:@"员村二横路2" telNumber:@"020-85533391"];
    
    [manager addCinemaWithName:@"粤艺影院" address:@"桂花岗一街" telNumber:@"020-83337061"];
    
    
    [manager addCinemaWithName:@"东山八一电影院" address:@"达道路16" telNumber:@"020-83330721"];
    
    [manager addCinemaWithName:@"花都数字电影城" address:@"新华路30号" telNumber:@"020-86832440"];
    
    [manager addCinemaWithName:@"沙河影剧场" address:@"沙河横马路37号" telNumber:@"020-87738713"];
    
    [manager addCinemaWithName:@"儿童电影院" address:@"海珠中路249号" telNumber:@"020-81375050"];
    
    [manager addCinemaWithName:@"摩登电影城" address:@"东圃大马路14" telNumber:@"020-62861010"];  
    
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
