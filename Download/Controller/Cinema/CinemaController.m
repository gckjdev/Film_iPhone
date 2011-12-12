//
//  CinemaController.m
//  Download
//
//  Created by  on 11-12-12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CinemaController.h"
#import "BookFilmController.h"
#import "DownloadResource.h"
#import "CinemaService.h"
#import "CinemaManager.h"
#import "CinemaCell.h"
#import "Cinema.h"
@implementation CinemaController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CinemaCell getCellHeight];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookFilmController *bookFilmController = [[BookFilmController alloc] init];
    [self.navigationController pushViewController:bookFilmController animated:YES];
    [bookFilmController release];
}

#pragma mark - CinemaServiceDelegate
-(void)willUpdateCinemaList
{
    
}

-(void)didUpdatedCinemaList:(NSInteger)errorCode
{
    
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self setBackgroundImageName:DOWNLOAD_BG];
    [self setDownloadNavigationTitle:@"电影院"];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [GlobalGetCinemaService() updateCinemaListWithCity:@"广州" delegate:self];
    self.dataList = [[CinemaManager defaultManager] cinemaList];
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
