//
//  WTFindTopView.m
//  WuTi
//
//  Created by Uekimu on 16/6/12.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTFindTopView.h"
#import "TestView.h"
#import "UIImageView+LBBlurredImage.h"

@implementation WTFindTopView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageArray = @[@"test.jpg",@"12-15050G51I90-L"];
    NSMutableArray* array = [NSMutableArray arrayWithArray:@[@"水墨画",@"素描作品",@"山水画",@"达芬奇",@"油画",@"向日葵",@"人物肖像作品",@"梵高",@"水墨画",@"素描作品",@"人物肖像作品"]];
    [self.labelView bindTags:array];

    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:[NSURL URLWithString:@"http://pic36.nipic.com/20131219/13743485_203640628148_2.jpg"]
                          options:0
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                             
                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                            if (image) {
                                [self.recommend setImageToBlur:image
                                                            blurRadius:5.0
                                                       completionBlock:^(){
                                                         
                                                       }];
                            }
                        }];
    // Initialization code
}

-(void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    
    for (int i=0; i<imageArray.count; i++) {
        NSString* string = imageArray[i];
        
        TestView* testView = [[NSBundle mainBundle]loadNibNamed:@"TestView" owner:self options:nil][0];
        
        testView.image.image = [UIImage imageNamed:string];
        
        testView.frame = CGRectMake(15+i*315, 0, 300, 80);
        
        [self.scrollView addSubview:testView];
        self.scrollView.contentSize = CGSizeMake(testView.right+10, self.scrollView.height);
    }
    
}



@end
