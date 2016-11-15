//
//  WTFirstViewController.m
//  WuTi
//
//  Created by Uekimu on 16/5/16.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTFirstViewController.h"
#import "WTLoginViewController.h"
#import "WTTabBarController.h"
#import "WTRegistViewController.h"

@interface WTFirstViewController ()

@end

@implementation WTFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)regist:(id)sender {
    WTRegistViewController* vc = [[WTRegistViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)login:(id)sender {
    WTLoginViewController* vc = [[WTLoginViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)see:(id)sender {
    WTTabBarController * tabvc = [[WTTabBarController alloc]init];
    [self presentViewController:tabvc animated:NO completion:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
