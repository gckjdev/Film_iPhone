    //
//  BookFilmCell.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "BookFilmCell.h"
#import "Film.h"
#import "DownloadResource.h"
#import "NSAttributedString+Attributes.h"
#import "OHAttributedLabel.h"
#import "NumberUtil.h"
#import "FontUtils.h"
@implementation BookFilmCell

@synthesize filmName;
@synthesize director;
@synthesize actors;
@synthesize price;
@synthesize debate;
@synthesize poster;

+ (BookFilmCell*)createCell:(id)delegate
{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"BookFilmCell" owner:self options:nil];
    // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).  
    if (topLevelObjects == nil || [topLevelObjects count] <= 0){
        NSLog(@"create <BookFilmCell> but cannot find cell object from Nib");
        return nil;
    }
    
    BookFilmCell* cell = ((BookFilmCell*)[topLevelObjects objectAtIndex:0]);
    cell.delegate = delegate;
    UIImageView *bgView = [[UIImageView alloc]initWithImage:RESOURCE_CELL_BG_IMAGE];
    cell.backgroundView = bgView;
    [bgView release];
    return cell;
}

+ (NSString*)getCellIdentifier
{
    return @"BookFilmCell";
}

+ (CGFloat)getCellHeight
{
    return 184.0f;
}

- (void)setPriceLabel:(float)fPrice
{
    NSInteger priceInteger = fPrice;
    NSInteger priceDecimal = getDecimal(fPrice);
    
    NSString* priceText = nil;
    if (priceDecimal == 0) {
        priceText = [NSString stringWithFormat:@"价格:  %d  元", priceInteger];
    }else{
        priceText = [NSString stringWithFormat:@"价格:  %d.%d  元", priceInteger,priceDecimal];
    }
    
    NSMutableAttributedString* attrStr = [NSMutableAttributedString attributedStringWithString:priceText];
    
    [attrStr setFont:[FontUtils HeitiSC:24]];
    [attrStr setTextColor:[UIColor colorWithRed:245/255.0 green:109/255.0 blue:42/255.0 alpha:1.0f]];    
    
    [attrStr setTextColor:CELL_TEXT_COLOR range:[priceText rangeOfString:@" 元"]];
    
    [attrStr setFont:[FontUtils HeitiSC:12] range:[priceText rangeOfString:@" 元"]];
    
    if (priceDecimal != 0) {
        NSString *text = [NSString stringWithFormat:@".%d",priceDecimal];
        [attrStr setFont:[FontUtils HeitiSC:18] range:[priceText rangeOfString:text]];
    }
    
    [attrStr setFont:[FontUtils HeitiSC:12] range:[priceText rangeOfString:@"价格:"]];
    
    [attrStr setTextColor:CELL_TEXT_COLOR range:[priceText rangeOfString:@"价格:"]];
    
    self.price.attributedText = attrStr;
    self.price.backgroundColor = [UIColor clearColor];
    [self.price setTextAlignment:UITextAlignmentLeft];
}



- (void)setDebateLabel:(float)fDebate
{
    NSInteger priceInteger = fDebate;
    NSInteger priceDecimal = getDecimalWithPoint(fDebate, 1);
    
    NSString* priceText = nil;
    if (priceDecimal == 0) {
        priceText = [NSString stringWithFormat:@"折扣:    %d  折", priceInteger];
    }else{
        priceText = [NSString stringWithFormat:@"折扣:    %d.%d  折", priceInteger,priceDecimal];
    }
    
    NSMutableAttributedString* attrStr = [NSMutableAttributedString attributedStringWithString:priceText];

    [attrStr setTextColor:CELL_TEXT_COLOR];    
    [attrStr setFont:[FontUtils HeitiSC:12]];    
    
//    [attrStr setFont:[FontUtils HeitiSC:24]];
//    [attrStr setTextColor:[UIColor colorWithRed:245/255.0 green:109/255.0 blue:42/255.0 alpha:1.0f]];    
//    
//    [attrStr setTextColor:CELL_TEXT_COLOR range:[priceText rangeOfString:@" 折"]];
//    
//    [attrStr setFont:[FontUtils HeitiSC:12] range:[priceText rangeOfString:@" 折"]];
//    
//    if (priceDecimal != 0) {
//        NSString *text = [NSString stringWithFormat:@".%d",priceDecimal];
//        [attrStr setFont:[FontUtils HeitiSC:18] range:[priceText rangeOfString:text]];
//    }
//    
//    [attrStr setFont:[FontUtils HeitiSC:12] range:[priceText rangeOfString:@"折扣:"]];
//    
//    [attrStr setTextColor:CELL_TEXT_COLOR range:[priceText rangeOfString:@"折扣:"]];
    
    self.debate.attributedText = attrStr;
    self.debate.backgroundColor = [UIColor clearColor];
    [self.debate setTextAlignment:UITextAlignmentLeft];
}

- (void)setCellInfo:(Film *)film
{

    [film.actorList componentsJoinedByString:@" "];
    self.filmName.text = [NSString stringWithFormat:@"%@",film.name];
    self.director.text  = [NSString stringWithFormat:@"%@: %@",@"导演",film.director];
    self.actors.text  = [NSString stringWithFormat:@"%@: %@",@"主演",[film.actorList componentsJoinedByString:@"/"]];
    
    [self setPriceLabel:film.price];
    [self setDebateLabel:film.debate];

  //  self.debate.text  = [NSString stringWithFormat:@"%@: %.1f",@"折扣",film.debate];

    
    self.poster.image = film.image;
    
}

- (void)dealloc {
    [filmName release];
    [director release];
    [actors release];
    [price release];
    [debate release];
    [poster release];
    [super dealloc];
}


@end
