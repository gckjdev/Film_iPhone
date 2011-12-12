//
//  BuyFilmController.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "BuyFilmController.h"
#import "DownloadResource.h"
#import "CinemaController.h"
#import "UIUtils.h"
enum{
    ROW_FILM_COUNT = 0,
    ROW_CINEMA_SELECTION,
    ROW_SEAT_SELECTION,
    ROW_PRICE_DISPLAY,
    ROW_FILM_PAY,
    ROW_CALL,
    ROW_COUNT
};

@implementation BuyFilmController
@synthesize filmNumber;
@synthesize filmPrice;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        filmNumber = [[UITextField alloc] initWithFrame:CGRectMake(200, 10, 80, 30)];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - tableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ROW_COUNT;
}

-(void)setFilmNumberCell:(UITableViewCell *)cell
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 10, 280, 30);
    label.text = @"票数";
    label.backgroundColor = [UIColor clearColor];
    filmNumber.text = @"1";
    filmNumber.borderStyle = UITextBorderStyleBezel;
    [cell.contentView addSubview:label];
    [label release];
    [cell.contentView addSubview:filmNumber];
}

-(void)setPriceCell:(UITableViewCell *)cell
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 10, 280, 30);
    filmPrice = 28;
    label.text = [NSString stringWithFormat:@"票价:    %.1f X %d = %.1f 元",filmPrice, 2, 56.0];
    label.backgroundColor = [UIColor clearColor];

    [cell.contentView addSubview:label];
    [label release];
}

-(void)setCallLabel:(UITableViewCell *)cell
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 10, 280, 30);
    label.backgroundColor = [UIColor clearColor];
    label.text = @"电话预订";
    [cell.contentView addSubview:label];
    [label release];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

}

-(void)setCinemaSelectionCell:(UITableViewCell *)cell 
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 260, 30)];
    [label setText:@"选择电影院"];
    [label setTextColor:[UIColor blackColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:label];
    [label release];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierString = @"BuyFilmCellIdentifier";
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:identifierString];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] init] autorelease];
    }
    switch (indexPath.row) {
        case ROW_FILM_COUNT:
        {
            [self setFilmNumberCell:cell];
            break; 
        }
        case ROW_CINEMA_SELECTION:
        {
            [self setCinemaSelectionCell:cell];
            break;
        }
        case ROW_SEAT_SELECTION:
        {
            break;
        }
        case ROW_PRICE_DISPLAY:
        {
            [self setPriceCell:cell];
            break;
        }
        case ROW_FILM_PAY:
        {
            break;
        }
        case ROW_CALL:
        {
            [self setCallLabel:cell];
            break;
        }
        default:
            break;
    }
    return cell;
    
//    ROW_CINEMA_SELECTION,
//    ROW_SEAT_SELECTION,
//    ROW_PRICE_DISPLAY,
//    ROW_FILM_PAY,
//    ROW_CALL,
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case ROW_FILM_COUNT:
        {
            return 50;
            break; 
        }
        case ROW_CINEMA_SELECTION:
        {
            return 50;
        }
        case ROW_PRICE_DISPLAY:
        {
            return 50;
        }
        default:
            return 50;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    switch (indexPath.row) {

        case ROW_CINEMA_SELECTION:
        {
            CinemaController *cc = [[CinemaController alloc] init];
            [self.navigationController pushViewController:cc animated:YES];
            [cc release];
            break;
        }
        case ROW_CALL:
        {
            [UIUtils makeCall:@"tel://12580"];
            break;
        }
        default:
            break;
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self setBackgroundImageName:DOWNLOAD_BG];
    [self setDownloadNavigationTitle:@"预订"];    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
