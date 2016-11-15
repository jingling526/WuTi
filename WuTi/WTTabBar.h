//
//  WTTabbar.h
//  MedicalTreatment
//
//  Created by Alex on 15/7/15.
//  Copyright (c) 2015年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTTabBarButton.h"
@class WTTabBar;

@protocol WTTabbarDelegate <NSObject>

-(void)tabBar:(WTTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface WTTabBar : UIView

@property (nonatomic, weak) id<WTTabbarDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *tabBarButtons;
@property (nonatomic, weak) WTTabBarButton *selectedButton;

-(void)buttonClick:(WTTabBarButton *)button;

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@end
