//
//  BuyFilmController.h
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPTableViewController.h"
#import "PickSeatController.h"
#import "UIBlankView.h"
#import "CinemaController.h"
@class Film;
@interface BuyFilmController : PPTableViewController<UITextFieldDelegate,
                                UIBlankViewDelegate,PickSeatDelegate,pickCinemaDelegate>
{
    UITextField *filmNumber;
    UILabel *priceLabel;
    Film *_fiml;
    NSInteger number;
    UILabel *cinemaLabel;
    UILabel *seatLabel;    
}

@property(nonatomic, retain) Film *film;
@property(nonatomic, retain) Cinema *cinema;
@property(nonatomic, assign) BOOL hasConstCinema;
-(id)initWithFilm:(Film *)film;
@end
