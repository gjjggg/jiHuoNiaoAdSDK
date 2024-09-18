//
//  ExpressSplashAdViewController.m
//  GuangGaoCeDemo
//
//  Created by ooo on 2024/9/5.
//

#import "ExpressSplashAdViewController.h"


@interface ExpressSplashAdViewController ()<JHNSplashAdDelegate>
@property (nonatomic,strong)JHNSplashAd *jhnSplashAd;
@property(nonatomic,strong) UIImageView *logoImgView;
@property(nonatomic,strong) UIButton * loadAndShowAdButton;
@end

@implementation ExpressSplashAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = UIColor.brownColor;
    [self layoutUI];
//    [EasyTextView showSuccessText:@"开屏视图预加载成功!"];
  
}

- (void)layoutUI {
    
    [self.view addSubview:self.loadAndShowAdButton];
    //开屏广告
    self.jhnSplashAd =  [[JHNSplashAd alloc] init];
    self.jhnSplashAd.delegate = self;
    //如果需设置底部logoView
    [self.jhnSplashAd setLogoBottom:[self bottomView]];
}

- (void)loadAndShowAd:(UIButton *)button{
    
    //加载并显示
    [self.jhnSplashAd loadAd];
   
}
#pragma mark 开屏⼴告曝光
- (void)JHNSplashViewRenderSuccess {
    [XHToast showCenterWithText:@"开屏⼴告曝光"];
    NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
}
#pragma mark 开屏⼴告点击
- (void)JHNSplashViewDidClick {
    [XHToast showCenterWithText:@"开屏⼴告点击"];
    NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
}
#pragma mark 开屏⼴告关闭
- (void)JHNSplashViewDidClose {
    [XHToast showCenterWithText:@"开屏⼴告关闭"];
   NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
   
}
#pragma mark 开屏网络请求成功
- (void)JHNSplashViewLoadSuccess{
    [XHToast showCenterWithText:@"开屏网络请求成功"];
    NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
}
#pragma mark 开屏网络请求错误
- (void)JHNSplashViewFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage{
     NSLog(@"JHN------[%ld-%@]",code,tipStr);
    [XHToast showCenterWithText:@"开屏网络请求错误"];
   
}




/*------------底部视图----------*/
-(UIImageView *)logoImgView{
    
    if (!_logoImgView) {
        UIImage *image = [UIImage imageNamed:@"applogo"];
        _logoImgView = [[UIImageView alloc] initWithImage:image];
        _logoImgView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 35, 15, 70, 70);
    }
    return _logoImgView;
}

-(UIView *)bottomView{
    UIView * bottomView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120)];
    bottomView.backgroundColor = UIColor.brownColor;
    [bottomView addSubview:self.logoImgView];
    return bottomView;
}

/**
 lazy loading
 */

- (UIButton *)loadAndShowAdButton {
    
    if (!_loadAndShowAdButton) {
        _loadAndShowAdButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _loadAndShowAdButton.frame = CGRectMake(60, 100, self.view.frame.size.width - 120,100);
        [_loadAndShowAdButton setTitle:@"拉取并展示开屏广告" forState:UIControlStateNormal];
        [_loadAndShowAdButton addTarget:self action:@selector(loadAndShowAd:) forControlEvents:UIControlEventTouchUpInside];
        _loadAndShowAdButton.backgroundColor = AdSColor(251, 66, 74);
        [_loadAndShowAdButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _loadAndShowAdButton.layer.cornerRadius = 8;
        _loadAndShowAdButton.layer.masksToBounds = NO;
        _loadAndShowAdButton.layer.shadowOffset =  CGSizeMake(1, 1);
        _loadAndShowAdButton.layer.shadowOpacity = 0.8;
        _loadAndShowAdButton.layer.shadowColor =  [UIColor blackColor].CGColor;
        [_loadAndShowAdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loadAndShowAdButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    }
    return _loadAndShowAdButton;
}


@end
