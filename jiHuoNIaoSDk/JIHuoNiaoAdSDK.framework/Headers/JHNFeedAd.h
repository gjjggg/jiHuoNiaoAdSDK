//
//  JHNFeedAd.h
//  JIHuoNiaoAdSDK
//
//  Created by ooo on 2024/9/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JHNFeedAdDelegate <NSObject>

@optional

/**
 信息流⼴告加载成功 返回数据源
 */
- (void)JHNFeedAdDidLoad:(NSArray *)feedDataArray;

/**
 信息流视频⼴告错误
 */
- (void)JHNFeedAdFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage;

/**
 信息流⼴告渲染成功
 */
- (void)JHNFeedAdViewRenderSuccess;

/**
 信息流⼴告曝光成功
 */
- (void)JHNFeedAdViewExposure;

/**
 信息流⼴告关闭
 */
- (void)JHNFeedAdDidClose:(id)feedAd;

/**
 信息流⼴告点击
 */
- (void)JHNFeedAdDidClick;

@end

@interface JHNFeedAd : NSObject

@property(nonatomic,weak) id<JHNFeedAdDelegate> delegate;

//自动播放时，是否静音。默认 YES。loadAd前设置。
//@property (nonatomic, assign) BOOL videoMuted;

- (instancetype)initWithWidth:(CGFloat)width;

- (void)loadAdWithCount:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END
