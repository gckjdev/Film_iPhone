//
//  BookFilmController.m
//  Download
//
//  Created by  on 11-12-11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "BookFilmController.h"
#import "DownloadResource.h"
#import "BookFilmCell.h"
#import "FilmManager.h"
#import "FilmService.h"
#import "BuyFilmController.h"

@implementation BookFilmController

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
 
    BookFilmCell *cell = [tableView dequeueReusableCellWithIdentifier:[BookFilmCell getCellIdentifier]];
    if (cell == nil) {
        cell = [BookFilmCell createCell:self];
    }
    Film *film = [dataList objectAtIndex:indexPath.row];
    if (film) {
       [cell setCellInfo:film]; 
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [BookFilmCell getCellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BuyFilmController *buyFilmController = [[BuyFilmController alloc] init];
    [self.navigationController pushViewController:buyFilmController animated:YES];
    [buyFilmController release];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self setBackgroundImageName:DOWNLOAD_BG];
    [self setDownloadNavigationTitle:self.tabBarItem.title];
    [super viewDidLoad];

    
    [GlobalGetFilmService() updateFilmList]; 
    self.dataList = [[FilmManager defaultManager] filmList];
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
