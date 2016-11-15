//
//  TestView.h
//  WuTi
//
//  Created by Uekimu on 16/6/13.
//  Copyright © 2016年 UK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopLeftLabel : UILabel {
}
@end

@interface TestView : UIView
@property (weak, nonatomic) IBOutlet TopLeftLabel *content;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
