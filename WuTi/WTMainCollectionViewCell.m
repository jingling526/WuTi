//
//  WTMainCollectionViewCell.m
//  WuTi
//
//  Created by Uekimu on 16/5/13.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTMainCollectionViewCell.h"

@implementation WTMainCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setLabel:self.content string:self.content.text withLineSpacing:5];
    
    // Initialization code
}

-(void)setLabel:(UILabel *)label string:(NSString *)str withLineSpacing:(CGFloat)space{
    
    NSMutableAttributedString * mas=[[NSMutableAttributedString alloc]init];
    
    NSMutableParagraphStyle * style=[NSMutableParagraphStyle new];
    
    style.alignment=NSTextAlignmentLeft;
    
    style.lineSpacing=space;
    
    style.lineBreakMode = NSLineBreakByWordWrapping;
    
    style.paragraphSpacing=space;
    
    NSDictionary * attributesDict=@{
                                    NSFontAttributeName:[UIFont systemFontOfSize:10],
                      
                                    NSForegroundColorAttributeName:UIColorFromRGB(0x999999),
                                    
                                    NSParagraphStyleAttributeName:style
                                    };
    
    NSAttributedString *as=[[NSAttributedString alloc]initWithString:str attributes:attributesDict];
    
    [mas appendAttributedString:as];
    
    [label setAttributedText:mas];
}

@end
