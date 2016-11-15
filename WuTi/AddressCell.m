//
//  AddressCell.m
//  WuTi
//
//  Created by Uekimu on 16/5/25.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "AddressCell.h"

@implementation AddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)makeDefault:(id)sender {
    [self.delegate defaultAddress:self.path];
}

- (IBAction)edit:(id)sender {
    [self.delegate editAddress];
    
}
- (IBAction)delete:(id)sender {
    [self.delegate deleteAddress:self.path];
    
}

@end
