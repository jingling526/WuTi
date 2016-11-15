//
//  WTTabBarController.h
//  WuTi
//
//  Created by Uekimu on 16/5/12.
//  Copyright © 2016年 UK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WTNavigationController;

@class WTTabBar;

@interface WTTabBarController : UITabBarController
@property(nonatomic,weak)WTTabBar *customTabbar;
@property(nonatomic,strong)WTNavigationController* nav;

@end
