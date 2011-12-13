//
//  PickSeatController.h
//  Download
//
//  Created by  on 11-12-13.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//


@protocol PickSeatDelegate <NSObject>

-(void)didPickSeat:(NSInteger )seatCount;

@end

#import <UIKit/UIKit.h>
#import "PPViewController.h"
@interface PickSeatController :PPViewController
{
    NSInteger _filmCount;
    NSInteger _currentCount;
}

@property(nonatomic, assign)id<PickSeatDelegate>delegate;
-(id)initWithFilmCount:(NSInteger)filmCount;

@end
