//
//  WTAddAddressController.m
//  WuTi
//
//  Created by Uekimu on 16/5/26.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTAddAddressController.h"
#import "AddressInputCell.h"
#import "AddressInput2Cell.h"

@interface WTAddAddressController ()

@end

@implementation WTAddAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"填写收货地址";
    self.view.backgroundColor = WTBackGroundColor;
    [self setupUI];
    [self setupBarItem];
    // Do any additional setup after loading the view.
}

-(void)setupUI{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 8)];
    self.tableView.backgroundColor = WTBackGroundColor;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    self.tableView.scrollEnabled = NO;
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gestureRecognizer.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:gestureRecognizer];
}

-(void)hideKeyboard{
    [self.view endEditing:YES];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row<3) {
        static NSString* cellID = @"AddressInputCell";
        AddressInputCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"AddressInputCell" owner:self options:nil][0];
        }
        if (indexPath.row == 0) {
            cell.title.text = @"收货人";
            cell.content.placeholder = @"请输入收件人姓名";
            cell.content.text = _name;
        }
        if (indexPath.row == 1) {
            cell.title.text = @"手机号码";
            cell.content.placeholder = @"请输入手机号码";
            cell.content.text = _phone;
        }
        if (indexPath.row == 2) {
            cell.title.text = @"地区";
            cell.content.placeholder = @"请输入地区";
            cell.content.text = _district;
        }
        return cell;
    }else{
        static NSString* cellID = @"AddressInput2Cell";
        AddressInput2Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"AddressInput2Cell" owner:self options:nil][0];
        }
        cell.content.text = _address;
        if (_address.length > 0) {
            cell.placeholder.text = @"";
        }
        return cell;
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 3) {
        return 95;
    }else{
        return 50;
    }
    
}

-(void)setupBarItem{
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)save{
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
