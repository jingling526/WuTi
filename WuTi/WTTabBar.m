//
//  WTTabbar.m
//  MedicalTreatment
//
//  Created by Alex on 15/7/15.
//  Copyright (c) 2015年 Alex. All rights reserved.
//

#import "WTTabbar.h"

@interface WTTabBar()

@end


@implementation WTTabBar

//懒加载
-(NSMutableArray *)tabBarButtons{
    if(_tabBarButtons == nil){
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        CALayer* layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0.5);
        layer.backgroundColor = RGB(231, 231, 231).CGColor;
        [self.layer addSublayer:layer];
    }
    return self;
}


-(void)addTabBarButtonWithItem:(UITabBarItem *)item{
    //创建按钮
    WTTabBarButton *button = [WTTabBarButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button];
    
    //传入item
    button.item = item;
    
    //监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //默认选中第0个按钮
    if(self.tabBarButtons.count == 0){
        [self buttonClick:button];
    }
    
    //把button放入数组
    [self.tabBarButtons addObject:button];
}

/**
 *  监听按钮点击
 */
-(void)buttonClick:(WTTabBarButton *)button{
    //通知代理
    if([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]){
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    //设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    // 按钮的frame数据
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = (self.frame.size.width-30) / self.subviews.count;
    CGFloat buttonY = 0;
    
    
    for (int index = 0; index < self.tabBarButtons.count; index++) {
        // 1.取出按钮
        WTTabBarButton *button = self.tabBarButtons[index];

        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW+15;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3.绑定tag
        button.tag = index;
  
    }

}




@end
