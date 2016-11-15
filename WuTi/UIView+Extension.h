//
//  UIView+Extension.h
//  MedicalTreatment
//
//  Created by Alex on 15/7/31.
//  Copyright (c) 2015年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (assign, nonatomic) CGPoint origin;
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;

@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;

@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;

@property (readonly, nonatomic) CGFloat bottom;
@property (readonly, nonatomic) CGFloat right;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

- (void)addShadowOnTop;
- (void)addShadowOnBottom;

@end
