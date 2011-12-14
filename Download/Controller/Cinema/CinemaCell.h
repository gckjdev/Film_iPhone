//
//  CinemaCell.h
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPTableViewCell.h"

@class Cinema;
@interface CinemaCell : PPTableViewCell
{
    Cinema *_cinema;
}
+ (CinemaCell*)createCell:(id)delegate;
+ (NSString*)getCellIdentifier;
+ (CGFloat)getCellHeight;
- (void)setCellInfo:(Cinema *)cinema;
@property (retain, nonatomic) IBOutlet UILabel *cinemaName;
@property (retain, nonatomic) IBOutlet UIButton *telNumber;
@property (retain, nonatomic) IBOutlet UILabel *cinemaAddress;
@property (retain, nonatomic) Cinema *cinema;
@property (retain, nonatomic) IBOutlet UIButton *makeCallButton;

- (IBAction)clickTel:(id)sender;
- (void)setSelectedStyle;
- (void)setUnselectedStyle;
@end
