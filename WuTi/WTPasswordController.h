//
//  WTPasswordController.h
//  WuTi
//
//  Created by Uekimu on 16/5/20.
//  Copyright © 2016年 UK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTPasswordController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirm;
@property (weak, nonatomic) IBOutlet UILabel *tips;

@end
