//
//  WTNavigationController.m
//  shitang
//
//  Created by Uekimu on 15/8/25.
//  Copyright (c) 2015年 UK. All rights reserved.
//

#import "WTNavigationController.h"
#import "UINavigationBar+Awesome.h"



@implementation WTNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    
    UIView* status = [[UIView alloc]initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, 20)];
    status.backgroundColor = [UIColor whiteColor];
    [self.navigationBar addSubview:status];
    
    self.navigationBar.layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 44-0.5, SCREEN_WIDTH, 0.5)];
    view.backgroundColor = UIColorFromRGB(0xDCDCDC);
    [self.navigationBar addSubview:view];
    

    
    return self;
}

+(void)initialize{
    [self setNavBarTheme];
    [self setNavBarItemTheme];
}

+ (void)setNavBarItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = UIColorFromRGB(0x999999);
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];

    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTintColor:[UIColor blackColor]];

}

+ (void)setNavBarTheme
{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.tintColor = [UIColor blackColor];
    
    [navBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [navBar setBarTintColor:[UIColor whiteColor]];
    [navBar setShadowImage:[[UIImage alloc] init]];

    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [navBar setTitleTextAttributes:textAttrs];
    
    UIImage *bg = [UIImage imageNamed:@"返回"];
    bg = [bg resizableImageWithCapInsets:UIEdgeInsetsMake(0,17,0,0)];
    
    [[UIBarButtonItem appearance]setBackButtonBackgroundImage:bg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance]setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
       
}


+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size

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


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
   
    if(self.viewControllers.count > 0){
        //push的时候 把tabbar隐藏
        viewController.hidesBottomBarWhenPushed = YES;
    }

    [super pushViewController:viewController animated:YES];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    
    UIViewController *returnController = [super popViewControllerAnimated:animated];
    
    // update navigationBar style
    return returnController;
}



@end
