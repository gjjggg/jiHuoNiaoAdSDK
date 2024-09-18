//
//  JHNBaseNavigationeController.m
//  adspace
//
//  Created by xq on 2022/7/19.
//

#import "JHNBaseNavigationeController.h"

@interface JHNBaseNavigationeController ()

@end

@implementation JHNBaseNavigationeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.translucent = NO;
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.barTintColor = [UIColor whiteColor];
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                 NSFontAttributeName:[UIFont systemFontOfSize:18]};
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
        [appearance configureWithOpaqueBackground];
        appearance.backgroundColor = AdSColor(251, 66, 74);
        appearance.backgroundEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
        appearance.titleTextAttributes = attributes;
        self.navigationBar.scrollEdgeAppearance = appearance;
        self.navigationBar.standardAppearance = appearance;
    } else {
        [self.navigationBar setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setTitleTextAttributes:attributes];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
}

#pragma mark -private
- (void)backToViewController{
    [self popViewControllerAnimated:YES];
}

@end
