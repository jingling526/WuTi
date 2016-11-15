//
//  WTTabBarController.m
//  shitang
//
//  Created by Uekimu on 15/8/25.
//  Copyright (c) 2015年 UK. All rights reserved.
//

#import "WTTabBarController.h"
#import "WTTabBar.h"
#import "WTNavigationController.h"

#import "WTMainViewController.h"
#import "WTDiscoverViewController.h"
#import "WTCommunityViewController.h"
#import "WTExperienceViewController.h"
#import "WTMineViewController.h"

@interface WTTabBarController()<WTTabbarDelegate>

@end

@implementation WTTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupTabBar];
    
    [self.tabBar setShadowImage:[self imageWithColor:[UIColor clearColor] size:CGSizeMake(SCREEN_WIDTH, 3)]];
    [self.tabBar setBackgroundImage:[self imageWithColor:[UIColor clearColor] size:CGSizeMake(SCREEN_WIDTH, 3)]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeTabBarButton) name:@"refreshTab" object:nil];
    [self setupAllChildViewControllers];
    
}

-(void)removeTabBarButton{
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size

{
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context,
                                   
                                   color.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

-(void)tabBar:(WTTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to{
    self.selectedIndex = to;
}

-(void)setupTabBar{
    
    WTTabBar *customTabBar = [[WTTabBar alloc]initWithFrame:self.tabBar.bounds];
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabbar = customTabBar;
}

-(void)setupAllChildViewControllers{
    
    WTMainViewController* vc1 = [WTMainViewController new];
    [self setupChildViewController:vc1 title:@"首页" imageName:@"主页icon" selectedImageName:@"主页icon"];
    WTDiscoverViewController* vc2 = [WTDiscoverViewController new];
    [self setupChildViewController:vc2 title:@"发现" imageName:@"发现" selectedImageName:@"发现"];
    WTCommunityViewController* vc3 = [WTCommunityViewController new];
    [self setupChildViewController:vc3 title:@"社区" imageName:@"社区icon" selectedImageName:@"社区icon"];
    WTExperienceViewController* vc4 = [WTExperienceViewController new];
    [self setupChildViewController:vc4 title:@"体验" imageName:@"体验icon" selectedImageName:@"体验icon"];
    WTMineViewController* vc5 = [WTMineViewController new];
    [self setupChildViewController:vc5 title:@"我的" imageName:@"我的" selectedImageName:@"我的"];
    
}

- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    
    // 1.设置控制器的属性
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    // 2.包装一个导航控制器
    self.nav = [[WTNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:self.nav];
    
    [self.customTabbar addTabBarButtonWithItem:childVc.tabBarItem];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
