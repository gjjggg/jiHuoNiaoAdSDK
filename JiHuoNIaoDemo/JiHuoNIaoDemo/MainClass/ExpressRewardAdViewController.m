//
//  ExpressRewardAdViewController.m
//  JHNSDKDemo
//
//  Created by ZJL on 2022/07/13.
//

#import "ExpressRewardAdViewController.h"

@interface ExpressRewardAdViewController ()<JHNRewardAdDelegate>
@property (nonatomic,strong)UIButton *loadAdBtn;
@property (nonatomic,strong)UIButton *showAdBtn;
@property (nonatomic,strong)UIButton *loadShowAdBtn;
@property (nonatomic,strong)JHNRewardAd *jhnRewardAd;

@end

@implementation ExpressRewardAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
}

- (void)layoutUI {
    
    [self.view addSubview:self.loadAdBtn];
    [self.view addSubview:self.showAdBtn];
    [self.view addSubview:self.loadShowAdBtn];

    //拉取广告
    self.jhnRewardAd = [[JHNRewardAd alloc]init];
    self.jhnRewardAd.delegate = self;
   
}

//加载并显示
- (void)loadShowAction:(UIButton *)button{
    
//    [self.jhnRewardAd showRewardAd:self];
    [self.jhnRewardAd  loadShowRewardAd:self];
}


#pragma mark 激励视频⼴告网络加载成功
- (void)JHNRewardedVideoAdDidLoad{
    self.showAdBtn.enabled = YES;
    [XHToast showCenterWithText:@"激励视频⼴告网络加载成功"];
    NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
}
#pragma mark  激励视频⼴告曝光
- (void)JHNRewardedVideoAdViewRenderSuccess{
    [XHToast showCenterWithText:@"激励视频⼴告曝光"];
    NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
}
#pragma mark  激励视频⼴告关闭
- (void)JHNRewardedVideoAdDidClose{
    [XHToast showCenterWithText:@"激励视频⼴告关闭"];
    NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
    self.showAdBtn.enabled = NO;
}

#pragma mark  激励视频⼴告点击
- (void)JHNRewardedVideoAdDidClick{
    [XHToast showCenterWithText:@"激励视频⼴告点击"];
    NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
}

#pragma mark   激励视频⼴告奖励
- (void)JHNRewardedVideoAdHasReward{
    [XHToast showCenterWithText:@"激励视频⼴告奖励"];
    NSLog(@"激励成功JHN------%@",NSStringFromSelector(_cmd));
}
#pragma mark  激励视频⼴告错误
- (void)JHNRewardedVideoAdFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage{
    [XHToast showCenterWithText:@"激励视频⼴告错误"];
    NSLog(@"JHN------[%ld-%@]",code,tipStr);
}

/**
 lazy loading
 */

- (UIButton *)loadShowAdBtn {
    
    if (!_loadShowAdBtn) {
        _loadShowAdBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _loadShowAdBtn.frame = CGRectMake(60, 100, self.view.frame.size.width - 120,100);
        [_loadShowAdBtn setTitle:@"加载并显示激励视频" forState:UIControlStateNormal];
        [_loadShowAdBtn addTarget:self action:@selector(loadShowAction:) forControlEvents:UIControlEventTouchUpInside];
        _loadShowAdBtn.backgroundColor = AdSColor(251, 66, 74);
        [_loadShowAdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _loadShowAdBtn.layer.cornerRadius = 8;
        _loadShowAdBtn.layer.masksToBounds = NO;
        _loadShowAdBtn.layer.shadowOffset =  CGSizeMake(1, 1);
        _loadShowAdBtn.layer.shadowOpacity = 0.8;
        _loadShowAdBtn.layer.shadowColor =  [UIColor blackColor].CGColor;
        [_loadShowAdBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loadShowAdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    }
    return _loadShowAdBtn;
}

@end
