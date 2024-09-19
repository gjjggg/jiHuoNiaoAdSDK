//
//  JHNRewardAd.h
//  JIHuoNiaoAdSDK
//
//  Created by ooo on 2024/9/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol JHNRewardAdDelegate <NSObject>

@optional

/**
激励视频⼴告网络加载成功
*/
- (void)JHNRewardedVideoAdDidLoad;
/**
激励视频⼴告曝光
*/
- (void)JHNRewardedVideoAdViewRenderSuccess;
/**
激励视频⼴告点击
*/
- (void)JHNRewardedVideoAdDidClick;
/**
激励视频⼴告关闭
*/
- (void)JHNRewardedVideoAdDidClose;

 /**
 激励视频⼴告错误
 */

- (void)JHNRewardedVideoAdFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage;

/**
 激励视频⼴告奖励
 */
- (void)JHNRewardedVideoAdHasReward;

@end

@interface JHNRewardAd : NSObject


@property(nonatomic,weak) id<JHNRewardAdDelegate> delegate;


//加载并显示
- (void)loadShowRewardAd:(UIViewController *)viewController;
//仅加载
- (void)loadRewardAd;
//显示
- (void)showRewardAd:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
