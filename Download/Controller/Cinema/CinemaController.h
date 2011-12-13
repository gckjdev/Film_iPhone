//
//  CinemaController.h
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//


enum  {
    CINEMA_NORMAL = 0,
    CINEMA_PICKER = 1
    };

#import "Cinema.h"
@protocol pickCinemaDelegate <NSObject>

@required
-(void) didPickCinema:(Cinema *)aCinema;
@end

#import <UIKit/UIKit.h>
#import "PPTableViewController.h"
#import "CinemaService.h"

@interface CinemaController : PPTableViewController<CinemaServiceDelegate>{
    BOOL _pickType;
    NSInteger _selectedRow;
    Cinema *_selectedCinema;
}
- (id)initWithType:(NSInteger)type;
@property(nonatomic,readonly, getter = isPickType)BOOL pickType;
@property(nonatomic, assign) id<pickCinemaDelegate>delegate;
 @property(nonatomic, retain) Cinema *selectedCinema;
@end
