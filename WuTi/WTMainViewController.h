//
//  WTMainViewController.h
//  WuTi
//
//  Created by Uekimu on 16/5/12.
//  Copyright © 2016年 UK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTCollectionViewWaterfallLayout.h"

@interface MoreButton : UIButton

@end

@interface WTMainViewController : UIViewController<UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, strong)UICollectionView *collectionView;

@end
