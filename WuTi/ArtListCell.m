//
//  ArtListCell.m
//  WuTi
//
//  Created by Uekimu on 16/5/24.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "ArtListCell.h"

@implementation ArtListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    
    for (int i=0; i<imageArray.count; i++) {
        NSString* string = imageArray[i];
        UIImageView* art = [[UIImageView alloc]initWithImage:[UIImage imageNamed:string]];
        art.frame = CGRectMake(i*104, 0, 94, self.scrollView.height);
        [self.scrollView addSubview:art];
        self.scrollView.contentSize = CGSizeMake(art.right+10, self.scrollView.height);
    }
   
}

@end
