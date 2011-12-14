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


- (void)setCellInfo:(Film *)film
{

    [film.actorList componentsJoinedByString:@" "];
    self.filmName.text = [NSString stringWithFormat:@"%@",film.name];
    self.director.text  = [NSString stringWithFormat:@"%@: %@",@"导演",film.director];
    self.actors.text  = [NSString stringWithFormat:@"%@: %@",@"主演",[film.actorList componentsJoinedByString:@"/"]];
    self.price.text  = [NSString stringWithFormat:@"%@: %.1f",@"价格",film.price];
    self.debate.text  = [NSString stringWithFormat:@"%@: %.1f",@"折扣",film.debate];

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
