//
//  Cinema.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "Cinema.h"

@implementation Cinema
@synthesize cinemaId = _cinemaId;
@synthesize name = _name;
@synthesize address = _address;
@synthesize telNumber = _telNumber;

-(id)initWithCinemaId:(NSInteger)cinemaId name:(NSString *)name 
              address:(NSString *)address telNumber:(NSString *)telNumber
{
    self = [super init];
    if (self) {
        self.cinemaId = cinemaId;
        self.name = name;
        self.address = address;
        self.telNumber = telNumber;
    }
    return self;
}


-(void)dealloc
{
    [_telNumber release];
    [_name release];
    [_address release];
    [super dealloc];
}
@end
