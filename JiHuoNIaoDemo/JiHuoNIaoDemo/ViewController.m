//
//  ViewController.m
//  GuangGaoCeDemo
//
//  Created by ooo on 2024/9/3.
//

#import "ViewController.h"
#import "ExpressSplashAdViewController.h"
#import "ExpressRewardAdViewController.h"
#import "ExpressInterstitialAdViewController.h"
#import "ExpressFeedAdViewController.h"
#import "GDIndexGuangGao.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
//    [GDIndexGuangGao showView];
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"开屏 Splash",@"插屏 Interstitial",@"激励视频 Reward",@"信息流 Feed"];
    }
    return _dataSource;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString  *indentifier = @"adNameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:indentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30];
    cell.textLabel.textColor = [UIColor grayColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    switch (indexPath.row + 1) {
            
        case 1:[self SplashAd];
            break;
        case 2:[self Interstitial];
            break;
        case 3:[self RewardVideoAd];
            break;
        case 4:[self FeedAd];
            break;
        case 5:[self FullScreenAd];
            break;
        default:
            break;
    }
}

/* --开屏 */
-(void)SplashAd
{
  
    ExpressSplashAdViewController *vc = [[ExpressSplashAdViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
/* --插屏 */
-(void)Interstitial
{
    ExpressInterstitialAdViewController *vc = [[ExpressInterstitialAdViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
/* --激励视频 */
-(void)RewardVideoAd
{
    ExpressRewardAdViewController *vc = [[ExpressRewardAdViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
/* --信息流 */
-(void)FeedAd
{
    ExpressFeedAdViewController *vc = [[ExpressFeedAdViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
/* --全屏视频 */
-(void)FullScreenAd
{
//    ExpressFullScreenAdViewController *vc = [[ExpressFullScreenAdViewController alloc]init];
//    vc.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController pushViewController:vc animated:YES];
}


@end
