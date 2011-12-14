//
//  PickSeatController.m
//  Download
//
//  Created by  on 11-12-13.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "PickSeatController.h"
#import "DownloadResource.h"
#import "UIViewController+DownloadViewControllerAddition.h"

@implementation PickSeatController
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithFilmCount:(NSInteger)filmCount
{
    self = [super init];
    if (self) {
        _filmCount = filmCount;
        if (filmCount <= 0) {
            _filmCount = 10000000;
        }
        _currentCount = 0;
    }
    return self;
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#define SCROLL_VIEW_TAG 1234
#define COUNT_PER_ROW 6
- (void)createButtonsWithAction:(SEL)action count:(NSInteger)count
{
    if (count == 0) {
        return;
    }
    
    [[self.view viewWithTag:SCROLL_VIEW_TAG] removeFromSuperview];

    NSMutableArray* buttonArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < count; ++ i) {

        UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(160, 160, 50, 32)];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
        NSInteger row = i / COUNT_PER_ROW + 1;
        NSInteger number = i % COUNT_PER_ROW + 1;
        NSString *title = [NSString stringWithFormat:@"%d排%d号",row, number];
        
        [button setTitle:title forState:UIControlStateNormal];
        
        [button setBackgroundImage:[UIImage imageNamed:@"set2.png"] 
                          forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"set.png"] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTag:i];
        if ( i % 2 == rand()%3) {
            button.selected = YES;
            button.userInteractionEnabled = NO;
        }
        [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
        [buttonArray addObject:button];
        [button release];
    }
    
    UIScrollView *buttonScrollView = [PPViewController createButtonScrollViewByButtonArray:buttonArray buttonsPerLine:COUNT_PER_ROW buttonSeparatorY:2];
    [buttonArray release];
    buttonScrollView.tag = SCROLL_VIEW_TAG;     
    [buttonScrollView setFrame:CGRectMake(0, 0, 320, 440)];
    [buttonScrollView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:buttonScrollView];
    
}

- (void)pickSeat:(id)sender
{
    if (_currentCount == _filmCount) {
        NSString *msg = [NSString stringWithFormat:@"你已经选了%d张",_filmCount];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        [alert release];
        return;
    }
    UIButton *button = (UIButton *)sender;
    if (button.isSelected) {
        button.selected = NO;
        _currentCount --;
    }else{
        button.selected = YES;
        _currentCount ++;
    }
}

-(void)clickDone
{
    if (delegate&&[delegate respondsToSelector:@selector(didPickSeat:)]) {
        [delegate didPickSeat:_currentCount];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self setBackgroundImageName:DOWNLOAD_BG];
    [self setDownloadNavigationTitle:@"选座"];  

    [self setDownloadRightBarButton:@"  确定  " selector:@selector(clickDone)];
    [self setBackButton];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createButtonsWithAction:@selector(pickSeat:) count:60];
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
