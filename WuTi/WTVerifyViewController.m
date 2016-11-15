//
//  WTVerifyViewController.m
//  WuTi
//
//  Created by Uekimu on 16/5/20.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTVerifyViewController.h"
#import "WTPasswordController.h"

@interface WTVerifyViewController ()

@end

@implementation WTVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.title = @"验证码";
    // Do any additional setup after loading the view from its nib.
}

-(void)setupUI{
    self.verifyCode.layer.borderColor = RGB(220, 220, 220).CGColor;
    self.verifyCode.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 50)];
    self.verifyCode.leftViewMode = UITextFieldViewModeAlways;
    
}

- (IBAction)next:(id)sender {
    WTPasswordController* vc = [[WTPasswordController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
