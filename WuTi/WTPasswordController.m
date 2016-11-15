//
//  WTPasswordController.m
//  WuTi
//
//  Created by Uekimu on 16/5/20.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTPasswordController.h"

@interface WTPasswordController ()

@end

@implementation WTPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.navigationItem.title = @"登录密码";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupUI{
    
    UIButton* btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, 0, 50, 50);
    btn1.tag = 1;
    [btn1 setImage:[UIImage imageNamed:@"眼睛灰"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"眼睛黑"] forState:UIControlStateSelected];
    [btn1.imageView setContentMode:UIViewContentModeCenter];
    [btn1 addTarget:self action:@selector(invisable:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 0, 50, 50);
    btn2.tag = 2;
    [btn2 setImage:[UIImage imageNamed:@"眼睛灰"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"眼睛黑"] forState:UIControlStateSelected];
    [btn2.imageView setContentMode:UIViewContentModeCenter];
    [btn2 addTarget:self action:@selector(invisable:) forControlEvents:UIControlEventTouchUpInside];
    
    self.password.layer.borderColor = RGB(220, 220, 220).CGColor;
    self.password.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 50)];
    self.password.leftViewMode = UITextFieldViewModeAlways;
    self.password.rightView = btn1;
    self.password.rightViewMode = UITextFieldViewModeAlways;
    
    self.confirm.layer.borderColor = RGB(220, 220, 220).CGColor;
    self.confirm.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 50)];
    self.confirm.leftViewMode = UITextFieldViewModeAlways;
    self.confirm.rightView = btn2;
    self.confirm.rightViewMode = UITextFieldViewModeAlways;

    NSString* string = self.tips.text;
    NSMutableAttributedString* attString = [[NSMutableAttributedString alloc]initWithString:string];
    [attString addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0x00B7EE) range:[string rangeOfString:@"用户使用协议"]];
    self.tips.attributedText = attString;
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)invisable:(UIButton*)button{
    button.selected = !button.selected;
    switch (button.tag) {
        case 1:
            self.password.secureTextEntry = !self.password.secureTextEntry;
            break;
        case 2:
            self.confirm.secureTextEntry = !self.confirm.secureTextEntry;
            break;
        default:
            break;
    }
}

@end
