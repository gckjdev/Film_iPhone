//
//  CinemaController.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//
#import "UIViewController+DownloadViewControllerAddition.h"
#import "CinemaController.h"
#import "BookFilmController.h"
#import "DownloadResource.h"
#import "CinemaService.h"
#import "CinemaManager.h"
#import "CinemaCell.h"
#import "Cinema.h"
@implementation CinemaController
@synthesize pickType = _pickType;
@synthesize delegate;
@synthesize selectedCinema = _selectedCinema;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _selectedRow = -1;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        _pickType = CINEMA_NORMAL;
    }
    return self;
}
- (id)initWithType:(NSInteger)type
{
    self = [super init];
    if (self) {
        _pickType = type;
    }
    return self;
}

-(void)dealloc
{
    [_selectedCinema release];
    [super dealloc];
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
    return [dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:[CinemaCell getCellIdentifier]];
    if (cell == nil) {
        cell = [CinemaCell createCell:self];
    }
    Cinema *cinema = [dataList objectAtIndex:indexPath.row];
    if (cinema) {
        [cell setCellInfo:cinema]; 
    }
    if (_selectedCinema && cinema.cinemaId == _selectedCinema.cinemaId) {
        _selectedRow = indexPath.row;
    }
    if (_pickType == CINEMA_PICKER && _selectedRow == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;    
    }else  {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CinemaCell getCellHeight];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_pickType == CINEMA_NORMAL) {
        Cinema *cinema = [dataList objectAtIndex:indexPath.row];
        if (cinema) {
            BookFilmController *bookFilmController = [[BookFilmController alloc] initWithType:BOOK_FILM_SHOW cinema:cinema];
            [self.navigationController pushViewController:bookFilmController 
                                                 animated:YES];
            [bookFilmController release];    
        }

    }else if(_pickType == CINEMA_PICKER)
    {
        _selectedRow = indexPath.row;
        self.selectedCinema = [dataList objectAtIndex:_selectedRow];
        [tableView reloadData];
    }

}

#pragma mark - CinemaServiceDelegate
-(void)willUpdateCinemaList
{
    
}

-(void)didUpdatedCinemaList:(NSInteger)errorCode
{
    
}
#pragma mark - View lifecycle


-(void)clickDone
{
    [self.navigationController popViewControllerAnimated:YES];
    if (delegate && [delegate respondsToSelector:@selector(didPickCinema:)]) {
        Cinema *cinema = (_selectedRow >=0 && (_selectedRow < [dataList count])) ?
        [dataList objectAtIndex:_selectedRow] : nil;
        [delegate didPickCinema:cinema];
    }
    
}
- (void)viewDidLoad
{
    [self setBackgroundImageName:DOWNLOAD_BG];
    [self setDownloadNavigationTitle:@"电影院"];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[CinemaManager defaultManager] removeAllCinemas];
    [GlobalGetCinemaService() updateCinemaListWithCity:@"广州" delegate:self];
    self.dataList = [[CinemaManager defaultManager] cinemaList];
    
    if (_pickType == CINEMA_PICKER) {
        //[self setNavigationRightButtonWithSystemStyle:UIBarButtonSystemItemDone action:@selector(clickDone)];
        [self setDownloadRightBarButton:@"  确定  " selector:@selector(clickDone)];
        [self setBackButton];

    }
    

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
