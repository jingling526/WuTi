//
//  MyOrderCell.h
//  WuTi
//
//  Created by Uekimu on 16/6/1.
//  Copyright © 2016年 UK. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyOrderCellDelegate<NSObject>
@optional
-(void)blackClicked:(NSInteger)type;
-(void)whiteClicked:(NSInteger)type;
@end

@interface MyOrderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *serialNum;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UIButton *whiteBtn;
@property (weak, nonatomic) IBOutlet UIButton *blackBtn;
@property(nonatomic,strong)NSArray* imageArray;

@property(nonatomic,assign)NSUInteger type;
@property(nonatomic,strong)id<MyOrderCellDelegate>delegate;
@end
