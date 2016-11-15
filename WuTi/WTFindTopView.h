//
//  WTFindTopView.h
//  WuTi
//
//  Created by Uekimu on 16/6/12.
//  Copyright © 2016年 UK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLabelView.h"


@interface WTFindTopView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)NSArray* imageArray;
@property (weak, nonatomic) IBOutlet DLabelView *labelView;
@property (weak, nonatomic) IBOutlet UIImageView *recommend;


@end
