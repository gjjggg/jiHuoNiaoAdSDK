//
//  ExpressFeedAdViewController.m
//  JHNSDKDemo
//
//  Created by ZJL on 2022/08/03.
//

#import "ExpressFeedAdViewController.h"

@interface ExpressFeedAdViewController ()<JHNFeedAdDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UIButton *loadAdBtn;
@property(nonatomic,strong) JHNFeedAd *jhnFeedAd;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *feedAdAdViews;

@end

@implementation ExpressFeedAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
}

- (void)layoutUI {
    
    [self.view addSubview:self.tableView];
    [self loadFeedAd];
}

//广告请求接口
- (void)loadFeedAd {
    
    //设置宽度。高度是按宽度自适应
    CGFloat width = [UIScreen mainScreen].bounds.size.width-52;
    
    CGFloat height = 0;//高度是一个预设值，真正高度是按素材自适应的.最小建议值为120，传0为自适应

    self.jhnFeedAd = [[JHNFeedAd alloc] initWithWidth:width];
    self.jhnFeedAd.delegate = self;
    //拉取广告，count为拉取范围1-3，最大值为3条
    [self.jhnFeedAd loadAdWithCount:10];
}

#pragma mark  信息流⼴告加载成功 返回数据源
- (void)JHNFeedAdDidLoad:(NSArray *)feedDataArray{
    [XHToast showCenterWithText:@"信息流⼴告加载成功 返回数据源"];
    NSLog(@"JHN------成功请求到广告数据 %@",feedDataArray);
    self.feedAdAdViews = [NSMutableArray arrayWithArray:feedDataArray];
    [self.tableView reloadData];
}

#pragma mark   信息流视频⼴告错误
- (void)JHNFeedAdFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage{
    [XHToast showCenterWithText:@"信息流视频⼴告错误"];
    NSLog(@"JHN------[%ld-%@]",code,tipStr);
}

#pragma mark   信息流⼴告渲染成功
- (void)JHNFeedAdViewRenderSuccess{
    NSLog(@"JHN------JHNFeedAdViewRenderSuccess");
    //渲染成功 刷新tableview
//    [self.tableView reloadData];
    [XHToast showCenterWithText:@"信息流⼴告渲染成功"];
}
#pragma mark    信息流⼴告曝光成功
- (void)JHNFeedAdViewExposure {
    NSLog(@"JHN------JHNFeedAdViewExposure");
    [XHToast showCenterWithText:@"信息流⼴告曝光成功"];
}

#pragma mark     信息流⼴告关闭
- (void)JHNFeedAdDidClose:(id)feedAd {
    NSLog(@"JHN------JHNFeedAdDidClose");

    [self.feedAdAdViews removeObject:feedAd];
    [self.tableView reloadData];
    [XHToast showCenterWithText:@"信息流⼴告关闭"];
}
#pragma mark  点击
- (void)JHNFeedAdDidClick{
    NSLog(@"JHN------JHNFeedAdDidClick");
    [XHToast showCenterWithText:@" 点击"];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *view = self.feedAdAdViews[indexPath.row];
    return view.bounds.size.height+40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.feedAdAdViews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"jhnFeedAdcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    UIView *subView = (UIView *)[cell.contentView viewWithTag:1000];
    if ([subView superview]) {
        [subView removeFromSuperview];
    }
    UIView *view = self.feedAdAdViews[indexPath.row];
    
    UIView * backView = [[UIView alloc]init];
    backView.frame = CGRectMake(14, 10, SCREEN_WIDTH-28, view.bounds.size.height+20);
    backView.backgroundColor = UIColor.whiteColor;
    backView.layer.cornerRadius = 6;
    backView.clipsToBounds = YES;
    [cell.contentView addSubview:backView];
    
    view.tag = 1000;
    [self addAccessibilityIdentifier:view];
    view.frame =  CGRectMake(12, 10, backView.frame.size.width-24, view.bounds.size.height);
    [backView addSubview:view];
    
    cell.contentView.backgroundColor =  AdSColor(216, 216, 216);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    UIView *view = [cell.contentView viewWithTag:1000];
    if (view) {
        [self removeAccessibilityIdentifier:view];
    }
}

- (void)addAccessibilityIdentifier:(UIView *)adView {
    adView.accessibilityIdentifier = @"express_feed_view";
}

- (void)removeAccessibilityIdentifier:(UIView *)adView {
    adView.accessibilityIdentifier = nil;
}

- (NSMutableArray *)feedAdAdViews {
    if (!_feedAdAdViews) {
        _feedAdAdViews = [NSMutableArray array];
    }
    return _feedAdAdViews;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = self.view.bounds;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
       
    }
    return _tableView;
}

@end

