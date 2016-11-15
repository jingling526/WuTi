//
//  DLabelView.m
//  WuTi
//
//  Created by Uekimu on 16/6/13.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "DLabelView.h"
#import "DTagLabel.h"

@implementation DLabelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    }
    return self;
}

- (void)bindTags:(NSMutableArray*)tags
{
    CGFloat frameWidth = SCREEN_WIDTH-15;
    
    CGFloat tagsTotalWidth = 0.0f;
    CGFloat tagsTotalHeight = 0.0f;
    
    CGFloat tagHeight = 0.0f;
    for (NSString *tag in tags)
    {
        DTagLabel *tagLabel = [[DTagLabel alloc] initWithFrame:CGRectMake(tagsTotalWidth, tagsTotalHeight, 0, 0)];
        tagLabel.text = tag;
        tagsTotalWidth += tagLabel.frame.size.width + 10;
        tagHeight = tagLabel.frame.size.height;
        tagLabel.userInteractionEnabled = YES;
        if(tagsTotalWidth >= frameWidth)
        {
            tagsTotalHeight += tagLabel.frame.size.height + 10;
            tagsTotalWidth = 0.0f;
            tagLabel.frame = CGRectMake(tagsTotalWidth, tagsTotalHeight, tagLabel.frame.size.width, tagLabel.frame.size.height);
            tagsTotalWidth += tagLabel.frame.size.width + 10;
        }
        
        if(tagsTotalHeight+tagHeight<self.frame.size.height){
            [self addSubview:tagLabel];
        }
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTag:)];
        
        [tagLabel addGestureRecognizer:tap];
        
    }
    tagsTotalHeight += tagHeight;
    
//    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, tagsTotalHeight);
}

-(void)tapTag:(UITapGestureRecognizer*)recognizer{
    DTagLabel *tagLabel = (DTagLabel*)recognizer.view;
    NSLog(@"%@",tagLabel.text);
}

@end
