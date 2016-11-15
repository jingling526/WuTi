//
//  WTOptionController.h
//  WuTi
//
//  Created by Uekimu on 16/5/26.
//  Copyright © 2016年 UK. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WTOptionDelegate <NSObject>

-(void)refreshView;

@end

@interface WTOptionController : UIViewController

@property(nonatomic,strong)id<WTOptionDelegate>delegate;

@end
