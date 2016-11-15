//
//  TestView.m
//  WuTi
//
//  Created by Uekimu on 16/6/13.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "TestView.h"


@implementation TopLeftLabel
- (id)initWithFrame:(CGRect)frame {
    return [super initWithFrame:frame];
}
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    textRect.origin.y = bounds.origin.y;
    return textRect;
}
-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}
@end

@implementation TestView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setLabel:self.content string:self.content.text withLineSpacing:7];
    // Initialization code
}

-(void)setLabel:(TopLeftLabel *)label string:(NSString *)str withLineSpacing:(CGFloat)space{
    
    NSMutableAttributedString * mas=[[NSMutableAttributedString alloc]init];
    
    NSMutableParagraphStyle * style=[NSMutableParagraphStyle new];
    
    style.alignment=NSTextAlignmentLeft;
    
    style.lineSpacing=space;
    
    style.lineBreakMode = NSLineBreakByWordWrapping;
    
    style.paragraphSpacing=space;
    
    NSDictionary * attributesDict=@{
                                    NSFontAttributeName:[UIFont systemFontOfSize:12],
                                    
                                    NSForegroundColorAttributeName:UIColorFromRGB(0x999999),
                                    
                                    NSParagraphStyleAttributeName:style
                                    };
    
    NSAttributedString *as=[[NSAttributedString alloc]initWithString:str attributes:attributesDict];
    
    [mas appendAttributedString:as];
    
    [label setAttributedText:mas];
}



@end
