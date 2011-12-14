//
//  CoverflowViewController.m
//  Created by Devin Ross on 1/3/10.
//
/*
 
 tapku.com || http://github.com/devinross/tapkulibrary
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 */
#import "PromotionController.h"
#import "DownloadResource.h"
#import "BuyFilmController.h"
#import "FilmService.h"
#import "FilmManager.h"
#import "Film.h"

@implementation PromotionController
@synthesize coverflow,covers;


- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
		return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
	return YES;
}
- (void) didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}
- (void) viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
- (void) dealloc {
	[coverflow release];
	[covers release];
    [description release];
    [filmList release];
    [super dealloc];
}

- (NSString *)descriptionForIndex:(NSInteger)index
{
    NSArray *descs = [NSArray arrayWithObjects:
                      @"60张中影影票兑换券,30个新浪玩偶等,共125份礼品免费送给您!12580圣诞大派送。", 
                      @"12580订电影票买一赠一,方便又优惠,马上打电话订购吧。",
                      @"12580订电影票送10元话费,下单即送，订越多送越多。",
                      @"火山湖电影院订购1张电影票即获赠1张相同影院的电影通票。",
                      @"使用广发信用卡支付，可享受五折优惠。",nil];
    index %= [descs count];
    return [descs objectAtIndex:index];
}

#define DESC_X 25

- (void) loadView{
	
	CGRect r = [UIScreen mainScreen].bounds;
    //CGRect r = CGRectMake(0, 0, 320, 320);
	r = CGRectApplyAffineTransform(r, CGAffineTransformMakeRotation(90 * M_PI / 180.));
	r.origin = CGPointZero;
	
	self.view = [[[UIView alloc] initWithFrame:r] autorelease];
	
	
    self.view.backgroundColor = [UIColor whiteColor];
	self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	
	r = self.view.bounds;
	r.size.height = 1000;
	CGRect cr = CGRectMake(0, 0, 480, 250);
	coverflow = [[TKCoverflowView alloc] initWithFrame:cr];
	coverflow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	coverflow.coverflowDelegate = self;
	coverflow.dataSource = self;
    [self.view addSubview:coverflow];    
    
    description = [[UILabel alloc] initWithFrame:
                            CGRectMake(DESC_X, 310, 320 - 2 *DESC_X, 50)];
    [description setNumberOfLines:2];
    [description setTextColor:[UIColor grayColor]];
    [description setFont:[UIFont boldSystemFontOfSize:14]];
    [description setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:description];
    [description release];
	
	
}
#define COUNT 5

- (void) viewDidLoad {
    [self setDownloadNavigationTitle:@"促销"];  
    [super viewDidLoad];
    [GlobalGetFilmService() updateFilmList];
    NSArray *temp = [[FilmManager defaultManager] filmList];
    filmList = [[NSMutableArray alloc] init];
    covers = [[NSMutableArray alloc] init];
    
    int i = 0;
    for (Film *film in temp) {
        if ((i++ % ([temp count] /COUNT )) == 0) {
            [self.covers addObject:film.image];
            [filmList addObject:film];
        }
    }
	[coverflow setNumberOfCovers:[covers count]];
    [coverflow bringCoverAtIndexToFront:[covers count]/2 animated:NO];
	
}
- (void) viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque]; 
}
- (void) viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
//	[coverflow bringCoverAtIndexToFront:[covers count]/2 animated:NO];
}
- (void) viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void) info{
	
    [self dismissModalViewControllerAnimated:YES];

}
- (void) changeNumberOfCovers{
	
	NSInteger index = coverflow.currentIndex;
	NSInteger no = arc4random() % [covers count];
	NSInteger newIndex = MAX(0,MIN(index,no-1));
	
	//NSLog(@"Covers Count: %d index: %d",no,newIndex);
    
	[coverflow setNumberOfCovers:no];
	coverflow.currentIndex = newIndex;
	
}


- (void) coverflowView:(TKCoverflowView*)coverflowView coverAtIndexWasBroughtToFront:(int)index{
    [description setText:[self descriptionForIndex:index]];
}
- (TKCoverflowCoverView*) coverflowView:(TKCoverflowView*)coverflowView coverAtIndex:(int)index{
	
	TKCoverflowCoverView *cover = [coverflowView dequeueReusableCoverView];
	
	if(cover == nil){

		CGRect rect = CGRectMake(0, 0, 230, 300);

		cover = [[[TKCoverflowCoverView alloc] initWithFrame:rect] autorelease]; // 224
		cover.baseline = 200;
		
	}
	cover.image = [covers objectAtIndex:index%[covers count]];
	return cover;
	
}
- (void) coverflowView:(TKCoverflowView*)coverflowView coverAtIndexWasDoubleTapped:(int)index{
    
	TKCoverflowCoverView *cover = [coverflowView coverAtIndex:index];
	if(cover == nil) return;
    index %= [covers count];
    Film *film = [filmList objectAtIndex:index];
    BuyFilmController *bc = [[BuyFilmController alloc] initWithFilm:film];
    [self.navigationController pushViewController:bc animated:YES];
    [bc release];

}

@end