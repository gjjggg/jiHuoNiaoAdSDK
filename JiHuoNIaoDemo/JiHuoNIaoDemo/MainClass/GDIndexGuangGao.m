//
//  GDIndexGuangGao.m
//  GuDaShuZhi
//
//  Created by ooo on 2023/12/8.
//

#import "GDIndexGuangGao.h"
#define QiDongImageName @"qidong_img_10003"


@interface GDIndexGuangGao()<JHNSplashAdDelegate>
@property (nonatomic, strong) UIImageView *lunachImageView;

@property (nonatomic,strong)JHNSplashAd *jhnSplashAd;

@end
@implementation GDIndexGuangGao
+(void)showView{
    GDIndexGuangGao * guanggao = [[GDIndexGuangGao alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
}
-(instancetype)initWithFrame:(CGRect)frame
{
   
    if ( self = [super initWithFrame:frame]) {
        [self createUI];
    }
    
    return self;
    
}
-(void)createUI{

    self.lunachImageView = [[UIImageView alloc] init];
    self.lunachImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH , SCREEN_HEIGHT);
    self.lunachImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.lunachImageView.image = [UIImage imageNamed:QiDongImageName];
    self.lunachImageView.userInteractionEnabled = YES;
    [self addSubview:self.lunachImageView];
    [GDWindow addSubview:self];
    
    //开屏广告
    self.jhnSplashAd =  [[JHNSplashAd alloc] init];
    self.jhnSplashAd.delegate = self;
    
   [self.jhnSplashAd loadAd];

 
}
#pragma mark 开屏⼴告曝光
- (void)JHNSplashViewRenderSuccess {
    [self disMissViewWith:0.2];
    NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
}
#pragma mark 开屏⼴告点击
- (void)JHNSplashViewDidClick {
    NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
}
#pragma mark 开屏⼴告关闭
- (void)JHNSplashViewDidClose {
   NSLog(@"JHN------%@",NSStringFromSelector(_cmd));
    [self disMissViewWith:0.5];
}
#pragma mark 开屏网络请求成功
- (void)JHNSplashViewLoadSuccess{
    NSLog(@"JHNSplashViewLoadSuccess");
}
#pragma mark 开屏网络请求错误
- (void)JHNSplashViewFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage{
     NSLog(@"JHN------[%ld-%@]",code,tipStr);
     [self disMissViewWith:0.5];
}


-(void)disMissViewWith:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
        [[NSNotificationCenter defaultCenter] postNotificationName:StartAnimateEnd object:nil];
    }];
}


-(void)dealloc{
    
}

@end
