//
//  AddressCell.h
//  WuTi
//
//  Created by Uekimu on 16/5/25.
//  Copyright © 2016年 UK. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddressCellDelegate<NSObject>

-(void)editAddress;
-(void)deleteAddress:(NSIndexPath*)path;
-(void)defaultAddress:(NSIndexPath*)path;

@end
@interface AddressCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *defaultBtn;
@property (nonatomic,strong)NSIndexPath* path;
@property(nonatomic,strong)id<AddressCellDelegate>delegate;

@end
