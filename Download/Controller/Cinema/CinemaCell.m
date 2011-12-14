//
//  CinemaCell.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CinemaCell.h"
#import "Cinema.h"
#import "UIUtils.h"
#import "DownloadResource.h"
@implementation CinemaCell
@synthesize cinemaName;
@synthesize telNumber;
@synthesize cinemaAddress;
@synthesize cinema = _cinema;
@synthesize makeCallButton;

+ (CinemaCell*)createCell:(id)delegate
{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CinemaCell" owner:self options:nil];
    // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).  
    if (topLevelObjects == nil || [topLevelObjects count] <= 0){
        NSLog(@"create <CinemaCell> but cannot find cell object from Nib");
        return nil;
    }
    
    CinemaCell *cell = [topLevelObjects objectAtIndex:0];
    cell.delegate = delegate;
    return cell;
}

+ (NSString*)getCellIdentifier
{
    return @"CinemaCell";
}

+ (CGFloat)getCellHeight
{
    return 85.0f;
}


- (void)setSelectedStyle
{
    UIImageView *sBgView = [[UIImageView alloc]initWithImage:RESOURCE_CELL_SELECTED_BG_IMAGE];
    self.backgroundView = sBgView;
    [sBgView release];
    [cinemaName setTextColor:[UIColor whiteColor]];
    [cinemaAddress setTextColor:[UIColor whiteColor]];
    [telNumber.titleLabel setTextColor:[UIColor whiteColor]];
}
- (void)setUnselectedStyle
{
    UIImageView *bgView = [[UIImageView alloc]initWithImage:RESOURCE_CELL_BG_IMAGE];
    self.backgroundView = bgView;
    [bgView release];
    [cinemaName setTextColor:CELL_TEXT_COLOR];
    [cinemaAddress setTextColor:CELL_TEXT_COLOR];
    [telNumber.titleLabel setTextColor:CELL_TEXT_COLOR];

}

- (void)setCellInfo:(Cinema *)cinema
{
    self.cinema = cinema;
    self.cinemaName.text = [NSString stringWithFormat:@"%@", cinema.name];
    self.cinemaAddress.text = [NSString stringWithFormat:@"地址: %@", cinema.address];
    [self.telNumber setTitle:[NSString stringWithFormat:@"电话: %@", cinema.telNumber] forState:UIControlStateNormal];
    [self.makeCallButton setBackgroundImage:ACTION_BUTTON_IMAGE forState:UIControlStateNormal];
}

- (void)dealloc {

    [cinemaName release];
    [cinemaAddress release];
    [telNumber release];
    [_cinema release];
    [makeCallButton release];
    [super dealloc];
}


- (IBAction)clickTel:(id)sender {
    NSString *tel = [NSString stringWithFormat:@"tel://%@",_cinema.telNumber];
    [UIUtils makeCall:tel];
}
@end
