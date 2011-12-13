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


@synthesize data;  

-(void)testDataInit
{  
    
    
    
    
    FilmManager *manager = [FilmManager defaultManager];
    [manager removeAllFilms];
    
    
    
//    
//    // Load the data.
//    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"Datadunpin" ofType:@"plist"];
//    self.data = [NSMutableArray arrayWithContentsOfFile:dataPath];
//    
//
//    
//    for (int i = 0; i <= 20; i++ ) {
//        
//       
//         NSMutableDictionary *dataItem = [self.data objectAtIndex:i];
//        
//        NSLog(@"%@,",[dataItem description]);
//        
//        [manager addFilmWithName:[dataItem objectForKey:@"FilmName"] 
//                       imageName:nil//[UIImage imageNamed:[dataItem objectForKey:@"FilmImage"]]
//                        director:[dataItem objectForKey:@"Director"]
//                        actorList:[dataItem objectForKey:@"Actors"]
//                            price:28
//                            value:60];
//    }
//
//
    
    
    [manager addFilmWithName:@"东成西就2011" 
                   imageName:@"4.jpg" 
                    director:@"刘镇伟 区雪儿" 
                   actorList:[NSArray arrayWithObjects:@"陈奕迅",@"莫文蔚",@"郑伊健", @"房祖名",@"方力申",@"黄奕", nil] 
                       price:28 value:60];

    
    [manager addFilmWithName:@"丁丁历险记：独角兽号的秘密" 
                   imageName:@"1.jpg" director:@"史蒂文·斯皮尔伯格" 
                   actorList:[NSArray arrayWithObjects:@"杰米·贝尔",@"安迪·瑟金斯",@"西蒙·佩吉", nil] 
                       price:28 value:60];
    
    [manager addFilmWithName:@"三傻大闹宝莱坞" 
                   imageName:@"2.jpg" 
                    director:@"拉库马·希拉尼" 
                   actorList:[NSArray arrayWithObjects:@"阿米尔·汗",@"马德哈万 ",@"沙尔曼·乔什吉", nil] 
                       price:28 value:60];
    

    [manager addFilmWithName:@"不怕贼惦记" 
                   imageName:@"3.jpg" 
                    director:@"许传海" 
                   actorList:[NSArray arrayWithObjects:@"岳秀清",@"吴刚", @"张斌",@"应采儿",@"张馨予", nil] 
                       price:28 value:60];
        
    [manager addFilmWithName:@"午夜凶梦" 
                   imageName:@"5.jpg" 
                    director:@"叶伟英" 
                   actorList:[NSArray arrayWithObjects:@"钟欣桐 ",@"周显欣",@"黄维德", nil] 
                       price:28 value:60];
    
    
    [manager addFilmWithName:@"婚前试爱"
                   imageName:@"6.jpg" 
                    director:@"叶念琛" 
                   actorList:[NSArray arrayWithObjects:@"周秀娜",@"罗仲谦",@"洪天明",@"庄思敏",@"杨梓瑶",@"沈志明", nil] 
                       price:28 value:60];
    [manager addFilmWithName:@"巨额交易" imageName:@"7.jpg" director:@"马俪文" 
                   actorList:[NSArray arrayWithObjects:@"蓝正龙",@"立威廉",@"韩彩英", nil] 
                       price:28 value:60];
    [manager addFilmWithName:@"开心家族" imageName:@"8.jpg" director:@"史蒂文·斯皮尔伯格" 
                   actorList:[NSArray arrayWithObjects:@"杰米·贝尔",@"安迪·瑟金斯",@"西蒙·佩吉", nil] 
                       price:28 value:60];
    [manager addFilmWithName:@"开心魔法" imageName:@"9.jpg" director:@"叶伟信" 
                   actorList:[NSArray arrayWithObjects:@"古天乐",@"黄百鸣",@"吴尊", nil] 
                       price:28 value:60];
    [manager addFilmWithName:@"惊天战神" imageName:@"10.jpg" director:@"塔西姆·辛" 
                   actorList:[NSArray arrayWithObjects:@"亨利·卡维尔@" ,@"米基·洛克",@"芙蕾达·平托", nil] 
                       price:28 value:60];
    
    
    
    
    
    
    [manager addFilmWithName:@"深海之战" imageName:@"11.jpg" director:@"金志勋" 
                   actorList:[NSArray arrayWithObjects:@"河智苑 ",@"吴志浩",@"安圣基", nil] 
                       price:28 value:60];
    [manager addFilmWithName:@"翻滚吧！阿信" imageName:@"12.jpg" director:@"林育贤" 
                   actorList:[NSArray arrayWithObjects:@"彭于晏",@"林辰唏",@"陈汉典", nil] 
                       price:28 value:60];
    [manager addFilmWithName:@"赛车传奇" imageName:@"13.jpg" director:@"罗义民 韩之夏" 
                   actorList:[NSArray arrayWithObjects:@"信 ",@"窦骁 ",@"张钧甯",@"王柏杰",@"曾志伟", nil] 
                       price:28 value:60];
    [manager addFilmWithName:@"追爱" imageName:@"14.jpg" director:@"刘怡明" 
                   actorList:[NSArray arrayWithObjects:@"应采儿",@"佟大为",@"董璇", nil] 
                       price:28 value:60];
    [manager addFilmWithName:@"遍地狼烟" imageName:@"15.jpg" director:@"胡大为" 
                   actorList:[NSArray arrayWithObjects:@"何润东",@"宋佳",@"梁家辉", nil] 
                       price:28 value:60];
    
    
    
    
    
    
    [manager addFilmWithName:@"驱魔者" imageName:@"16.jpg" director:@"斯科特·查尔斯·斯图瓦特" 
                   actorList:[NSArray arrayWithObjects:@"保罗·贝坦尼",@"卡尔·厄本 ",@"凯姆·吉甘戴", nil] 
                       price:28 value:60];
    [manager addFilmWithName:@"魔法奇幻秀" imageName:@"17.jpg" director:@"特瑞·吉列姆" 
                   actorList:[NSArray arrayWithObjects:@"希斯·莱杰 克里斯托弗·普卢默 莉莉·科尔", nil] 
                       price:28 value:60];
    [manager addFilmWithName:@"鸿门宴传奇" imageName:@"18.jpg" director:@"李仁港" 
                   actorList:[NSArray arrayWithObjects:@"黎明 ",@"冯绍峰 ",@"张涵予",@"刘亦菲", nil] 
                       price:28 value:60];
    [manager addFilmWithName:@"龙门飞甲" imageName:@"19.jpg" director:@"徐克" 
                   actorList:[NSArray arrayWithObjects:@"李连杰 ",@"陈坤",@"周迅",@"桂纶镁",@"樊少皇",@"李宇春", nil] 
                       price:28 value:60];
    [manager addFilmWithName:@"金陵十二钗" imageName:@"20.jpg" director:@"张艺谋" 
                   actorList:[NSArray arrayWithObjects:@"克里斯蒂安·贝尔",@"佟大为",@"窦骁", nil] 
                       price:28 value:60];


    
    
    
    
    
    
}
-(void)updateFilmList
{

    [self testDataInit];
}

@end
