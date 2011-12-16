//
//  HelpController.m
//  Download
//
//  Created by  on 11-12-13.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

enum
{
    HELP_USAGE = 0,
    HELP_PAYMENT,
    HELP_CALL,
    SECTION_COUNT
};

#define USAGE_CELL_HEIGHT 155
#define PAYMENT_CELL_HEIGHT 175
#define CALL_CELL_HEIGHT 44
#import "HelpController.h"
#import "DownloadResource.h"
#import "UIViewController+DownloadViewControllerAddition.h"
#import "UIUtils.h"

@implementation HelpController

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

-(void)call12580
{
    [UIUtils makeCall:@"12580"];
}

- (void)setCallCell:(UITableViewCell *)cell
{
    CGRect frame = CGRectMake(120, 10, 90, 30);
    UIButton * makeCallButton = [self getButtonWithFrame:frame imageName:nil 
                                                canClick:YES action:@selector(call12580)];
    [makeCallButton setBackgroundImage:ACTION_BUTTON_IMAGE forState:UIControlStateNormal];
    [makeCallButton setTitle:@"拨打12580" forState:UIControlStateNormal];
    [makeCallButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    makeCallButton.center = cell.contentView.center;
    [cell.contentView addSubview:makeCallButton];
}

- (void)setPaymentCell:(UITableViewCell *)cell
{
    CGRect frame = CGRectMake(10, 0, 300, PAYMENT_CELL_HEIGHT);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = CELL_TEXT_COLOR;
    
    label.text = @"银联支付: 银联支付银行（借记卡）有：广东省内开户的建设银行、农业银行、招商银行、华夏银行、邮政储蓄、交通银行、广州银行(商业银行)、中信银行、广发银行等(无需开通网银)。 \n\n手机支付: 手机支付仅适用于广东全球通用户，手机支付额度查询：发送”HFED”到106586633查询当前的话费支付额度，发送”CXYE”到106586633查询本月剩余的可消费额度。";
    [label setFont:[UIFont systemFontOfSize:12]];
    
    [label setNumberOfLines:0];
    [cell.contentView addSubview:label];
    [label release];
}


- (void)setUsageCell:(UITableViewCell *)cell
{
    CGRect frame = CGRectMake(10, 0, 300, USAGE_CELL_HEIGHT);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = CELL_TEXT_COLOR;
    
    label.text = @"第一步,在促销或者订票页面选择电影，然后点击进入预订页面。\n\n第二步，在预订页面选择电影院和座位。\n\n第三步，选择支付方式，进入支付页面完成支付;或者直接拨打12580手机支付。\n\n第四步，支付成功后，凭二维码到电影院消费。";
    [label setFont:[UIFont systemFontOfSize:12]];
    
    [label setNumberOfLines:0];
    [cell.contentView addSubview:label];
    [label release];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierString = @"HelpCellIdentifier";
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:identifierString];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] init] autorelease];
        UIImageView *bgView = [[UIImageView alloc] initWithImage:RESOURCE_CELL_BG_IMAGE];
        cell.backgroundView = bgView;
        [bgView release];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    switch (indexPath.section) {
        case HELP_USAGE:
            [self setUsageCell:cell];
            break;
        case HELP_PAYMENT:
            [self setPaymentCell:cell];
            break;
        case HELP_CALL:
            [self setCallCell:cell];
            break;
        default:
            break;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return SECTION_COUNT;		// default implementation	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case HELP_USAGE:
            return USAGE_CELL_HEIGHT;
        case HELP_PAYMENT:
            return PAYMENT_CELL_HEIGHT;
        case HELP_CALL:
            return CALL_CELL_HEIGHT;
        default:
            return 80.0;
    }
    
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case HELP_USAGE:
            return @"使用帮助";
        case HELP_PAYMENT:
            return @"支付帮助";
        case HELP_CALL:
            return @"人工帮助";
        default:
            return @"其他";
            break;
    }
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self setBackgroundImageName:DOWNLOAD_BG];
    [self setDownloadNavigationTitle:@"帮助"];  
    [super viewDidLoad];
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
