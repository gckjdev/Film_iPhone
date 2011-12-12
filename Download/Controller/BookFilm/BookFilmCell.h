//
//  BookFilmCell.h
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPTableViewCell.h"
#import "Film.h"
@interface BookFilmCell : PPTableViewCell
{
    
}
+ (BookFilmCell*)createCell:(id)delegate;
+ (NSString*)getCellIdentifier;
+ (CGFloat)getCellHeight;
- (void)setCellInfo:(Film *)film;
@property (retain, nonatomic) IBOutlet UILabel *filmName;
@property (retain, nonatomic) IBOutlet UILabel *director;
@property (retain, nonatomic) IBOutlet UILabel *actors;
@property (retain, nonatomic) IBOutlet UILabel *price;
@property (retain, nonatomic) IBOutlet UILabel *debate;
@property (retain, nonatomic) IBOutlet UIImageView *poster;

@end
