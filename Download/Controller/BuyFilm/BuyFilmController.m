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
#import "HelpController.h"
#import "UIUtils.h"
#import "Film.h"
#import "UIViewController+DownloadViewControllerAddition.h"


enum{
//    ROW_FILM_COUNT = 0,
    ROW_CINEMA_SELECTION = 0,
    ROW_SEAT_SELECTION,
    ROW_PRICE_DISPLAY,
    ROW_FILM_PAY,
    ROW_CALL,
    ROW_HELP,
    ROW_COUNT
};

@implementation BuyFilmController
@synthesize film = _fiml;
@synthesize cinema;
@synthesize hasConstCinema;
@synthesize selectSeatNumberList;

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
    [filmNumber release];
    [priceLabel release];
    [cinemaLabel release];
    [cinema release];
    [selectSeatNumberList release];
    [super release];
}

- (void)setcellTextDefaultColor
{
    filmNumber.textColor = CELL_TEXT_COLOR;
    priceLabel.textColor = CELL_TEXT_COLOR;
    cinemaLabel.textColor = CELL_TEXT_COLOR;
    seatLabel.textColor = CELL_TEXT_COLOR;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        filmNumber = [[UITextField alloc] initWithFrame:CGRectMake(200, 10, 70, 30)];
        priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 210, 30)];
        cinemaLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 270, 30)];
        seatLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 270, 30)];
        number = 0;
        hasConstCinema = NO;
        [self setcellTextDefaultColor];
        selectSeatNumberList = [[NSMutableSet alloc] init];
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
    label.textColor = CELL_TEXT_COLOR;
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
    if (number <= 0) {
        priceLabel.text = @"     0  元";
    }else{
        priceLabel.text = [NSString stringWithFormat:
                           @"%.1f X %d = %.1f 元",
                           _fiml.price, number, _fiml.price * number];
    }
}

-(void)setPriceCell:(UITableViewCell *)cell
{

    [self updatePriceLabel];
    priceLabel.backgroundColor = [UIColor clearColor];
    priceLabel.textAlignment = UITextAlignmentRight;
    [cell.contentView addSubview:priceLabel];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    label.text = @"票价合计";
    label.textColor = CELL_TEXT_COLOR;
    label.backgroundColor = [UIColor clearColor];
    [cell.contentView addSubview:label];
    [label release];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
}

- (UIButton *)getButtonWithFrame:(CGRect)frame imageName:(NSString *)imageName 
                        canClick:(BOOL)canClick action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (imageName) {
        UIImage *image = [UIImage imageNamed:imageName];
        [button setBackgroundImage:image forState:UIControlStateNormal];
    }
    button.userInteractionEnabled = canClick;
    if (canClick && action != nil) {
        [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}


- (void)clickUnionPay:(id)sender
{
    NSLog(@"click union pay button");
}

- (void)clickPhonePay:(id)sender
{
    NSLog(@"click phone pay button");
}

-(void)setPayCell:(UITableViewCell *)cell
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 10, 280, 30);
    label.text = @"确认支付";
    label.backgroundColor = [UIColor clearColor];
    label.textColor = CELL_TEXT_COLOR;
    [cell.contentView addSubview:label];
    [label release];

    CGRect unionPayFrame = CGRectMake(150, 7, 55, 35);
    CGRect phonePayFrame = CGRectMake(220, 7, 55, 35);

    UIButton *unionPayButton = [self getButtonWithFrame:unionPayFrame 
                                              imageName:@"unionPay.png" canClick:YES action:@selector(clickUnionPay:)];
    UIButton *phonePayButton = [self getButtonWithFrame:phonePayFrame 
                                              imageName:@"PhonePay.png" canClick:YES action:@selector(clickPhonePay:)];
    [cell.contentView addSubview:unionPayButton];
    [cell.contentView addSubview:phonePayButton];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)call12580
{
    [UIUtils makeCall:@"12580"];
}
-(void)setCallCell:(UITableViewCell *)cell
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 10, 280, 30);
    label.backgroundColor = [UIColor clearColor];
    label.text = @"人工预订";
    label.textColor = CELL_TEXT_COLOR;
    [cell.contentView addSubview:label];
    [label release];
    CGRect frame = CGRectMake(185, 10, 90, 30);
    UIButton * makeCallButton = [self getButtonWithFrame:frame imageName:nil 
                                                canClick:YES action:@selector(call12580)];
    [makeCallButton setBackgroundImage:ACTION_BUTTON_IMAGE forState:UIControlStateNormal];
    [makeCallButton setTitle:@"拨打12580" forState:UIControlStateNormal];
    [makeCallButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [cell.contentView addSubview:makeCallButton];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setHelpCell:(UITableViewCell *)cell
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 10, 280, 30);
    label.backgroundColor = [UIColor clearColor];
    label.text = @"查看帮助";
    label.textColor = CELL_TEXT_COLOR;
    [cell.contentView addSubview:label];
    [label release];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
}
-(void)updateCinemaSelectionLabel
{
    if (self.cinema != nil) {
        cinemaLabel.text = self.cinema.name;
        [cinemaLabel setTextAlignment:UITextAlignmentCenter];
    }else {
        cinemaLabel.text = @"选择影院";
        [cinemaLabel setTextAlignment:UITextAlignmentLeft];
    }
    cinemaLabel.textColor = CELL_TEXT_COLOR;
}
-(void)setCinemaSelectionCell:(UITableViewCell *)cell 
{
    [cinemaLabel setBackgroundColor:[UIColor clearColor]];
    [cell addSubview:cinemaLabel];
    [self updateCinemaSelectionLabel];
    if (hasConstCinema) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
//    }else{
//        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
}

-(void)updateSeatSelectionLabel
{
    if (number > 0) {
        seatLabel.text = [NSString stringWithFormat:@"已选择 %d 张",number];
        [seatLabel setTextAlignment:UITextAlignmentCenter];
    }else {
        seatLabel.text = @"请选择座位";
        [seatLabel setTextAlignment:UITextAlignmentLeft];
    }
}

-(void)setSeatSelectionCell:(UITableViewCell *)cell 
{
    [seatLabel setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:seatLabel];
    [self updateSeatSelectionLabel];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierString = @"BuyFilmCellIdentifier";
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:identifierString];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] init] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        switch (indexPath.row) {
//            case ROW_FILM_COUNT:
//            {
//                [self setFilmNumberCell:cell];
//                break; 
//            }
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
                [self setCallCell:cell];
                break;
            }
            case ROW_HELP:
            {
                [self setHelpCell:cell];
                break;
            }
            default:
                break;
        }    
    }

    return cell;
    

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {

        case ROW_CINEMA_SELECTION:
        {
            if (!hasConstCinema) {
                CinemaController *cc = [[CinemaController alloc] initWithType:CINEMA_PICKER];
                cc.selectedCinema = self.cinema;
                [self.navigationController pushViewController:cc animated:YES];
                cc.delegate = self;
                [cc release]; 
            }

            break;
        }
        case ROW_CALL:
        {
            break;
        }
        case ROW_SEAT_SELECTION:
        {
            if (self.cinema) {
                PickSeatController *pc = [[PickSeatController alloc] initWithFilm:self.film cinema:self.cinema];
//                if (selectSeatNumberList) {
                    pc.selectedSeatSet = selectSeatNumberList;
//                }
                [self.navigationController pushViewController:pc animated:YES];
                pc.delegate = self;
                [pc release];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请先选择电影院" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alert show];
                [alert release];
                [self.dataTableView reloadData];
            }
            break;
        }
        case ROW_HELP:
        {
            HelpController *hc = [[HelpController alloc] init];
            [hc setBackButton];
            [self.navigationController pushViewController:hc animated:YES];
            [hc release];
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

#pragma mark - blank view delegate

- (void)didClickBlankView
{
    number = [filmNumber.text integerValue];
    [self refixFilmNumberLabel];
    [self updatePriceLabel];
}

#pragma mark -pick seat && cinema delegate
-(void)didPickSeat:(NSMutableSet *)selectedSeatSet
{
    self.selectSeatNumberList = selectedSeatSet;
    number = [selectedSeatSet count];
    [self updatePriceLabel];
    [self refixFilmNumberLabel];
    [self updateSeatSelectionLabel];
}

-(void) didPickCinema:(Cinema *)aCinema
{
    self.cinema = aCinema;
    [self updateCinemaSelectionLabel];
    [self.selectSeatNumberList removeAllObjects];
    number = 0;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self setBackgroundImageName:DOWNLOAD_BG];
    [self setDownloadNavigationTitle:@"预订"];    
    [self setBackButton];
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
