//
//  PromotionController.h
//  Download
//
//  Created by  on 11-12-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapkuLibrary.h"
#import "PPViewController.h"
@interface PromotionController : PPViewController <TKCoverflowViewDelegate,TKCoverflowViewDataSource,UIScrollViewDelegate> {
	
	TKCoverflowView *coverflow; 
	NSMutableArray *covers; // album covers images
	BOOL collapsed;
	UILabel * description;
    NSMutableArray *filmList;
}

@property (retain,nonatomic) TKCoverflowView *coverflow; 
@property (retain,nonatomic) NSMutableArray *covers;

@end
