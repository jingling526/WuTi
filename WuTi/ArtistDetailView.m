//
//  ArtistDetailView.m
//  WuTi
//
//  Created by Uekimu on 16/5/24.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "ArtistDetailView.h"

@implementation ArtistDetailView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.content addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];
    
}
#pragma mark - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void *)context
{
    UITextView *tv = object;
    // Center vertical alignment
    CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale])/2.0;
    topCorrect = ( topCorrect < 0.0 ? 0.0 : topCorrect );
    tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
}

-(void)dealloc{
    [self.content removeObserver:self forKeyPath:@"contentSize"];
}
// Initialization code

@end
