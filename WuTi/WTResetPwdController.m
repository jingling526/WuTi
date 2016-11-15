//
//  WTResetPwdController.m
//  WuTi
//
//  Created by Uekimu on 16/5/18.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTResetPwdController.h"

@interface WTResetPwdController ()

@end

@implementation WTResetPwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.navigationItem.title = @"修改密码";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI{
    
    self.password.layer.borderColor = RGB(220, 220, 220).CGColor;
    self.confirmPwd.layer.borderColor = RGB(220, 220, 220).CGColor;
    UIImageView* image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"锁"]];
    image1.contentMode = UIViewContentModeCenter;
    image1.width = 35;
    UIImageView* image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"锁"]];
    image2.contentMode = UIViewContentModeCenter;
    image2.width = 35;
    self.password.leftView = image1;
    self.confirmPwd.leftView = image2;
    self.password.leftViewMode = UITextFieldViewModeAlways;
    self.confirmPwd.leftViewMode = UITextFieldViewModeAlways;
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
