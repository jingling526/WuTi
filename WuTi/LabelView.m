//
//  LabelView.m
//  WuTi
//
//  Created by Uekimu on 16/5/20.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "LabelView.h"
#import "TagLabel.h"

@implementation LabelView

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
    CGFloat frameWidth = self.frame.size.width;
    
    CGFloat tagsTotalWidth = 0.0f;
    CGFloat tagsTotalHeight = 0.0f;
    
    CGFloat tagHeight = 0.0f;
    for (NSString *tag in tags)
    {
        TagLabel *tagLabel = [[TagLabel alloc] initWithFrame:CGRectMake(tagsTotalWidth, tagsTotalHeight, 0, 0)];
        tagLabel.text = tag;
        tagsTotalWidth += tagLabel.frame.size.width + 9;
        tagHeight = tagLabel.frame.size.height;
        
        if(tagsTotalWidth >= frameWidth)
        {
            tagsTotalHeight += tagLabel.frame.size.height + 9;
            tagsTotalWidth = 0.0f;
            tagLabel.frame = CGRectMake(tagsTotalWidth, tagsTotalHeight, tagLabel.frame.size.width, tagLabel.frame.size.height);
            tagsTotalWidth += tagLabel.frame.size.width + 9;
        }
        [self addSubview:tagLabel];

    }
    tagsTotalHeight += tagHeight;
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, tagsTotalHeight);
}

@end
