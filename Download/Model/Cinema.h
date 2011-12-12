//
//  Cinema.h
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cinema : NSObject
{
    NSString *_name;
    NSString *_address;
    NSString *_telNumber;
    NSInteger _cinemaId;
}
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *address;
@property(nonatomic, retain) NSString *telNumber;
@property(nonatomic, assign) NSInteger cinemaId;


-(id)initWithCinemaId:(NSInteger)cinemaId name:(NSString *)name 
              address:(NSString *)address telNumber:(NSString *)telNumber;
@end
