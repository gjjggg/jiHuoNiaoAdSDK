//
//  ExpressInterstitialAdViewController.m
//  JHNSDKDemo
//
//  Created by ZJL on 2022/07/13.
//

#import "ExpressInterstitialAdViewController.h"
@interface ExpressInterstitialAdViewController ()<JHNInterstitialAdDelegate>
@property(nonatomic,strong) JHNInterstitialAd *jhnInterstitialAd;
@property(nonatomic,strong) UIButton *interstitialAdButton;

@end

@implementation ExpressInterstitialAdViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
}

- (void)layoutUI {
    
    [self.view addSubview:self.interstitialAdButton];
}

- (void)openAd:(UIButton *)button{

    self.jhnInterstitialAd = [[JHNInterstitialAd alloc] init];
    self.jhnInterstitialAd.delegate = self;
    [self.jhnInterstitialAd loadAd];
}


#pragma mark -  插⼴告错误
- (void)JHNInterstitialAdFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage{
    [XHToast showCenterWithText:@" 插⼴告错误"];
    NSLog(@"JHN------[%ld-%@]",code,tipStr);
}

#pragma mark -  插屏⼴告曝光
- (void)JHNInterstitialAdRenderSuccess{
    [XHToast showCenterWithText:@" 插屏⼴告曝光"];
    NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
}

#pragma mark -  插屏⼴告点击
- (void)JHNInterstitialAdDidClick{
    [XHToast showCenterWithText:@"插屏⼴告点击"];
    NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
}

#pragma mark -  插屏⼴告关闭
- (void)JHNInterstitialAdDidClose{
    [XHToast showCenterWithText:@"插屏⼴告关闭"];
    NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
}

/**
 lazy loading
 */

- (UIButton *)interstitialAdButton {
    
    if (!_interstitialAdButton) {
        _interstitialAdButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _interstitialAdButton.frame = CGRectMake(60, 100, self.view.frame.size.width - 120,100);
        [_interstitialAdButton setTitle:@"展示插屏广告" forState:UIControlStateNormal];
        [_interstitialAdButton addTarget:self action:@selector(openAd:) forControlEvents:UIControlEventTouchUpInside];
        _interstitialAdButton.backgroundColor = AdSColor(251, 66, 74);
        [_interstitialAdButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _interstitialAdButton.layer.cornerRadius = 8;
        _interstitialAdButton.layer.masksToBounds = NO;
        _interstitialAdButton.layer.shadowOffset =  CGSizeMake(1, 1);
        _interstitialAdButton.layer.shadowOpacity = 0.8;
        _interstitialAdButton.layer.shadowColor =  [UIColor blackColor].CGColor;
        [_interstitialAdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_interstitialAdButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    }
    return _interstitialAdButton;
}

@end
