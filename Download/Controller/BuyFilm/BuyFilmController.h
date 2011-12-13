//
//  BuyFilmController.h
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPTableViewController.h"
#import "UIBlankView.h"
@class Film;
@interface BuyFilmController : PPTableViewController<UITextFieldDelegate,UIBlankViewDelegate>
{
    UITextField *filmNumber;
    UILabel *priceLabel;
    Film *_fiml;
    NSInteger number;
    
}

@property(nonatomic, retain) Film *film;

-(id)initWithFilm:(Film *)film;
@end
