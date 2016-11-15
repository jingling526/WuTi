//
//  WTMainCollectionViewCell.h
//  WuTi
//
//  Created by Uekimu on 16/5/13.
//  Copyright © 2016年 UK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTMainCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *artist;
@property (weak, nonatomic) IBOutlet UILabel *field;
@property (weak, nonatomic) IBOutlet UIImageView *artistPhoto;

@end
