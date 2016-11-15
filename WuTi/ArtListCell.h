//
//  ArtListCell.h
//  WuTi
//
//  Created by Uekimu on 16/5/24.
//  Copyright © 2016年 UK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArtListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)NSArray* imageArray;
@end
