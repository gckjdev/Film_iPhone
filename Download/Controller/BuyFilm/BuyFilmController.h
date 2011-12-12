//
//  BuyFilmController.h
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPTableViewController.h"

@interface BuyFilmController : PPTableViewController
{
    UITextField *filmNumber;
    CGFloat filmPrice;
}

@property(nonatomic, retain) UITextField *filmNumber;
@property(nonatomic, assign) CGFloat filmPrice;
@end
