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
#import "Film.h"

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
@synthesize film = _fiml;


-(id)initWithFilm:(Film *)film
{
    self = [super init];
    if (self) {
        self.film = film;
    }
    return self;
}


-(void)dealloc
{
    [_fiml release];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        filmNumber = [[UITextField alloc] initWithFrame:CGRectMake(200, 10, 70, 30)];
        priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 210, 30)];
        number = 1;
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


- (void)refixFilmNumberLabel
{
    filmNumber.text = [NSString stringWithFormat:@"%d",number];
}

-(void)setFilmNumberCell:(UITableViewCell *)cell
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 10, 280, 30);
    label.text = @"票数";
    label.backgroundColor = [UIColor clearColor];
    [cell.contentView addSubview:label];
    [label release];
    filmNumber.borderStyle = UITextBorderStyleBezel;
    filmNumber.keyboardType = UIKeyboardTypeNumberPad;
    filmNumber.clearsOnBeginEditing = YES;
    [self refixFilmNumberLabel];
    [cell.contentView addSubview:filmNumber];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;

}

-(void)updatePriceLabel
{
    priceLabel.text = [NSString stringWithFormat:
                       @"%.1f X %d = %.1f 元",
                       _fiml.price, number, _fiml.price * number];
}

-(void)setPriceCell:(UITableViewCell *)cell
{

    [self updatePriceLabel];
    priceLabel.backgroundColor = [UIColor clearColor];
    priceLabel.textAlignment = UITextAlignmentRight;
    [cell.contentView addSubview:priceLabel];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 30)];
    label.text = @"票价:";
    label.backgroundColor = [UIColor clearColor];
    [cell.contentView addSubview:label];
    [label release];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
}

-(void)setPayCell:(UITableViewCell *)cell
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 10, 280, 30);
    label.text = @"确认支付";
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


}

-(void)setCinemaSelectionCell:(UITableViewCell *)cell 
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 260, 30)];
    [label setText:@"选择电影院"];
    [label setTextColor:[UIColor blackColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:label];
    [label release];

}

-(void)setSeatSelectionCell:(UITableViewCell *)cell 
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 260, 30)];
    [label setText:@"选择座位"];
    [label setTextColor:[UIColor blackColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:label];
    [label release];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierString = @"BuyFilmCellIdentifier";
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:identifierString];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] init] autorelease];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
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
            [self setSeatSelectionCell:cell];
            break;
        }
        case ROW_PRICE_DISPLAY:
        {
            [self setPriceCell:cell];
            break;
        }
        case ROW_FILM_PAY:
        {
            [self setPayCell:cell];
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


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _fiml.name;
}

#pragma mark - textfield delegate
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    number = [textField.text integerValue];
    [self updatePriceLabel];
    return YES;
}

#pragma mark - blacnk view delegate

- (void)didClickBlankView
{
    number = [filmNumber.text integerValue];
    [self refixFilmNumberLabel];
    [self updatePriceLabel];
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

- (void)viewDidAppear:(BOOL)animated
{
    [self addBlankView:95 currentResponder:filmNumber];
    [self setBlankViewDelegate:self];
    [super viewDidAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
