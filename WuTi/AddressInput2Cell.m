//
//  AddressInput2Cell.m
//  WuTi
//
//  Created by Uekimu on 16/5/26.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "AddressInput2Cell.h"

@implementation AddressInput2Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0){
        _placeholder.text = @"请输入详细地址";
    } else {
        _placeholder.text = @"";
    }

    if ([textView.text length] > 50) {
        textView.text = [textView.text substringToIndex:50];
    }
}

@end
