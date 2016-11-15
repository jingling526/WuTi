//
//  MoneyDetailCell.m
//  WuTi
//
//  Created by Uekimu on 16/5/27.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "MoneyDetailCell.h"

@implementation MoneyDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSMutableAttributedString* string = [[NSMutableAttributedString alloc]initWithString:self.total.text];
    [string addAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xF05A11)} range:NSMakeRange(5, self.total.text.length-5)];
    _total.attributedText = string;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
