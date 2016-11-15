//
//  WTTabbarButton.m
//  DesignExhibition
//
//  Created by Alex on 15/5/9.
//  Copyright (c) 2015年 Alex. All rights reserved.
//

#import "WTTabbarButton.h"


//上面图片的比例
#define WTTabBarImageRatio 0.70

@interface WTTabBarButton()

@end

@implementation WTTabBarButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:9];
        
        //文字的颜色
        [self setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [self setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateSelected];
        
        //设置背景图片
        //        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_back"] forState:UIControlStateNormal];
        //        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_back_selected"] forState:UIControlStateSelected];
        
    }
    return self;
}

//重写 去掉高亮状态
-(void)setHighlighted:(BOOL)highlighted{
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * WTTabBarImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height * WTTabBarImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY - 10;
    
    return CGRectMake(0, titleY, titleW, titleH);
}

-(void)setItem:(UITabBarItem *)item{
    _item = item;
    
    //KVO 监听属性改变
    
    //    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

-(void)dealloc{
    
    //    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

/**
 *  监听到某个属性改变了 就会调用
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    //设置文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    
    //设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
}
@end
