//
//  WTRegistViewController.m
//  WuTi
//
//  Created by Uekimu on 16/5/20.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTRegistViewController.h"
#import "WTVerifyViewController.h"

@interface WTRegistViewController ()

@end

@implementation WTRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.title = @"注册";
    // Do any additional setup after loading the view from its nib.
}

-(void)setupUI{
    self.phoneNum.layer.borderColor = RGB(220, 220, 220).CGColor;
    self.phoneNum.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 50)];
    self.phoneNum.leftViewMode = UITextFieldViewModeAlways;
    
    UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
    [item setTitle:@"登录" forState:UIControlStateNormal];
    item.frame = CGRectMake(0, 0, 29, 24);
    [item setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateNormal];
    item.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [item addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:item];
    self.navigationItem.rightBarButtonItem= barItem;
    
}

- (IBAction)next:(id)sender {
    WTVerifyViewController* vc = [[WTVerifyViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)login{
    
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
