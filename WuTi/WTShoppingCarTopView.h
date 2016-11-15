//
//  WTShoppingCarTopView.h
//  WuTi
//
//  Created by Uekimu on 16/5/23.
//  Copyright © 2016年 UK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTShoppingCarTopView : UICollectionReusableView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;
@end
