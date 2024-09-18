//
//  JHNInterstitialAd.h
//  JIHuoNiaoAdSDK
//
//  Created by ooo on 2024/9/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol JHNInterstitialAdDelegate <NSObject>
@optional

/**
 插⼴告错误
 */
- (void)JHNInterstitialAdFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage;

/**
 插屏⼴告曝光
 */
- (void)JHNInterstitialAdRenderSuccess;

/**
 插屏⼴告点击
 */
- (void)JHNInterstitialAdDidClick;

/**
 插屏⼴告关闭
 */
- (void)JHNInterstitialAdDidClose;

@end
@interface JHNInterstitialAd : NSObject
@property(nonatomic,weak) id<JHNInterstitialAdDelegate> delegate;


/*
 加载成功后直接显示，暂无预加载
 */
- (void)loadAd;

//- (void)onlyShow;
@end

NS_ASSUME_NONNULL_END
