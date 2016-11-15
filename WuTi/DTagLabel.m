//
//  DTagLabel.m
//  WuTi
//
//  Created by Uekimu on 16/5/20.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "DTagLabel.h"

@implementation DTagLabel


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xE8E8E8);
        self.textColor = RGB(51, 51, 51);
        self.font = [UIFont systemFontOfSize:12];
        self.textAlignment = NSTextAlignmentCenter;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 15.0;
        
    }
    return self;
}

-(void)setText:(NSString *)text
{
    super.text = text;
    
    CGRect frame = [self.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil];
    CGSize size = frame.size;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width + 40, 30);
}

@end
