//
//  TYKSplashAd.h
//  JIHuoNiaoAdSDK
//
//  Created by ooo on 2024/9/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol JHNSplashAdDelegate <NSObject>
/**
 开屏⼴告曝光
 */
- (void)JHNSplashViewRenderSuccess;
/**
 开屏⼴告点击
 */
- (void)JHNSplashViewDidClick;
/**
 开屏⼴告关闭
 */
- (void)JHNSplashViewDidClose;

/**
 开屏网络请求成功
 */
- (void)JHNSplashViewLoadSuccess;

/**
 开屏网络请求错误
 */
- (void)JHNSplashViewFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage;

@end

@interface JHNSplashAd : NSObject

@property(nonatomic,weak) id<JHNSplashAdDelegate> delegate;

/*
 如果需要设置logo则调用，非必需
 **/
- (void)setLogoBottom:(UIView *)logoBottom;

/*
 加载成功后直接显示
 */
- (void)loadAd;

/*
 加载广告
 */
- (void)onlyLoad;

/*
 显示
 */
- (void)onlyShow;

@end


NS_ASSUME_NONNULL_END
