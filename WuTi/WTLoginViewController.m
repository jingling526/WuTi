//
//  WTLoginViewController.m
//  WuTi
//
//  Created by Uekimu on 16/5/17.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTLoginViewController.h"
#import "WTForgetPwdController.h"

@interface WTLoginViewController ()

@end

@implementation WTLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.title = @"登录";
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)login:(id)sender {
  
}

- (IBAction)forget:(id)sender {
    WTForgetPwdController * vc = [[WTForgetPwdController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setupUI{
    
    self.phoneNum.layer.borderColor = RGB(220, 220, 220).CGColor;
    self.password.layer.borderColor = RGB(220, 220, 220).CGColor;
    UIImageView* image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"手机icon"]];
    image1.contentMode = UIViewContentModeCenter;
    image1.width = 35;
    UIImageView* image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"锁"]];
    image2.contentMode = UIViewContentModeCenter;
    image2.width = 35;
    self.phoneNum.leftView = image1;
    self.password.leftView = image2;
    self.phoneNum.leftViewMode = UITextFieldViewModeAlways;
    self.password.leftViewMode = UITextFieldViewModeAlways;
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
