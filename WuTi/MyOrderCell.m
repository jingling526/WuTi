//
//  MyOrderCell.m
//  WuTi
//
//  Created by Uekimu on 16/6/1.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "MyOrderCell.h"

@implementation MyOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.whiteBtn.layer.borderColor =
    UIColorFromRGB(0x999999).CGColor;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)blackClicked:(id)sender {
    [self.delegate blackClicked:self.type];
}
- (IBAction)whiteClicked:(id)sender {
    [self.delegate whiteClicked:self.type];
}

-(void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    
    for (int i=0; i<imageArray.count; i++) {
        NSString* string = imageArray[i];
        UIImageView* art = [[UIImageView alloc]initWithImage:[UIImage imageNamed:string]];
        art.frame = CGRectMake(i*136, 0, 126, self.scrollView.height);
        [self.scrollView addSubview:art];
        self.scrollView.contentSize = CGSizeMake(art.right+10, self.scrollView.height);
    }
    
}

-(void)setType:(NSUInteger)type{
    _type = type;
    if (_type == 1) {
        [self.whiteBtn setTitle:@"取消订单" forState:UIControlStateNormal];
        [self.blackBtn setTitle:@"立即支付" forState:UIControlStateNormal];
        self.status.text = @"待支付";
    }
    if (_type == 2) {
        [self.whiteBtn setTitle:@"删除订单" forState:UIControlStateNormal];
        [self.blackBtn setTitle:@"申请售后" forState:UIControlStateNormal];
        self.status.text = @"交易成功";
    }
    if (_type == 3) {
        [self.whiteBtn setTitle:@"提醒发货" forState:UIControlStateNormal];
        [self.blackBtn removeFromSuperview];
        self.status.text = @"待发货";
    }
    if (_type == 4) {
        [self.whiteBtn setTitle:@"删除订单" forState:UIControlStateNormal];
        [self.blackBtn removeFromSuperview];
        self.status.text = @"订单超时";
    }
    
    
}

@end
