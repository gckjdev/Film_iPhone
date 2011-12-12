//
//  CinemaCell.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CinemaCell.h"
#import "Cinema.h"
@implementation CinemaCell
@synthesize cinemaName;
@synthesize telNumber;
@synthesize cinemaAddress;


+ (CinemaCell*)createCell:(id)delegate
{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CinemaCell" owner:self options:nil];
    // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).  
    if (topLevelObjects == nil || [topLevelObjects count] <= 0){
        NSLog(@"create <CinemaCell> but cannot find cell object from Nib");
        return nil;
    }
    
    ((CinemaCell*)[topLevelObjects objectAtIndex:0]).delegate = delegate;
    
    return (CinemaCell*)[topLevelObjects objectAtIndex:0];
}

+ (NSString*)getCellIdentifier
{
    return @"CinemaCell";
}

+ (CGFloat)getCellHeight
{
    return 80.0f;
}


- (void)setCellInfo:(Cinema *)cinema
{
    self.cinemaName.text = [NSString stringWithFormat:@"名称: %@", cinema.name];
    self.cinemaAddress.text = [NSString stringWithFormat:@"地址: %@", cinema.address];
    [self.telNumber setTitle:[NSString stringWithFormat:@"电话: %@", cinema.telNumber] forState:UIControlStateNormal];
    
}

- (void)dealloc {

    [cinemaName release];
    [cinemaAddress release];
    [telNumber release];
    [super dealloc];
}


@end
