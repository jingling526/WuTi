//
//  PayMethodCell.m
//  WuTi
//
//  Created by Uekimu on 16/5/26.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "PayMethodCell.h"

@implementation PayMethodCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if(selected){
        [_indicator setImage:[UIImage imageNamed:@"椭圆 1 拷贝 3"]];
    }else{
        [_indicator setImage:[UIImage imageNamed:@"椭圆 1"]];
    }
    // Configure the view for the selected state
}

@end
