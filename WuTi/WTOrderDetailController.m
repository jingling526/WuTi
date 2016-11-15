//
//  WTOrderDetailController.m
//  WuTi
//
//  Created by Uekimu on 16/5/27.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTOrderDetailController.h"
#import "OrderAddressCell.h"
#import "ArtListCell.h"
#import "PayWayCell.h"
#import "MoneyDetailCell.h"
#import "WTAddressController.h"
#import "WTArtListController.h"
#import "WTOrderPayWayController.h"

@interface WTOrderDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,weak)UIButton* blackBtn;
@property(nonatomic,weak)UIButton* whiteBtn;
@end

@implementation WTOrderDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单详情";
    self.view.backgroundColor = WTBackGroundColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupUI];
    // Do any additional setup after loading the view.
}

-(void)setupUI{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-50-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = WTBackGroundColor;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 55)];
    [self.view addSubview:self.tableView];
    
    UIView* bottomBar = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WIDTH, 50)];
    bottomBar.backgroundColor = UIColorFromRGB(0xFFFFFF);
    bottomBar.layer.borderWidth = 0.5;
    bottomBar.layer.borderColor = UIColorFromRGB(0xE6E6E6).CGColor;
    [self.view addSubview:bottomBar];
    
    UIButton* blackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [blackBtn setBackgroundColor:UIColorFromRGB(0x333333)];
    blackBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    blackBtn.frame = CGRectMake(SCREEN_WIDTH*0.5, SCREEN_HEIGHT-50, SCREEN_WIDTH*0.5, 50);
    [blackBtn addTarget:self action:@selector(payOrder) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blackBtn];
    _blackBtn = blackBtn;
    
    UIButton* whiteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [whiteBtn setBackgroundColor:[UIColor whiteColor]];
    [whiteBtn setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateNormal];
    whiteBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    whiteBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH*0.5, 50);
    [whiteBtn addTarget:self action:@selector(cancelOrder) forControlEvents:UIControlEventTouchUpInside];
    [bottomBar addSubview:whiteBtn];
    _whiteBtn = whiteBtn;
    
    [self confirmType];
}

-(void)confirmType{
    if (self.type == 1) {
        [_blackBtn setTitle:@"立即支付" forState:UIControlStateNormal];
        [_whiteBtn setTitle:@"取消订单" forState:UIControlStateNormal];
    }
    
    if (self.type == 2) {
        [_blackBtn setTitle:@"申请售后" forState:UIControlStateNormal];
        [_whiteBtn setTitle:@"删除订单" forState:UIControlStateNormal];
    }
    if (self.type == 3) {
        [_whiteBtn removeFromSuperview];
        [_blackBtn setTitle:@"提醒发货" forState:UIControlStateNormal];
        _blackBtn.frame = CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WIDTH, 50);
    }
    if (self.type == 4) {
        [_whiteBtn removeFromSuperview];
        [_blackBtn setTitle:@"删除订单" forState:UIControlStateNormal];
        _blackBtn.frame = CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WIDTH, 50);
    }
}

-(void)payOrder{
    if (self.type == 1) {
        WTOrderPayWayController* vc = [[WTOrderPayWayController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

-(void)cancelOrder{
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 1) {
        static NSString* cellID = @"AddressCell";
        OrderAddressCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"OrderAddressCell" owner:self options:nil][0];
        }
        return cell;
    }else if(indexPath.section == 2){
        static NSString* cellID = @"PayWayCell";
        PayWayCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"PayWayCell" owner:self options:nil][0];
        }
        return cell;
    }else if(indexPath.section == 3){
        static NSString* cellID = @"ArtListCell";
        ArtListCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"ArtListCell" owner:self options:nil][0];
        }
        cell.imageArray = @[@"20081119204358972_2",@"20081119204358972_2",@"20081119204358972_2",@"20081119204358972_2",@"20081119204358972_2"];
        return cell;
    }else if (indexPath.section == 4){
        static NSString* cellID = @"MoneyDetailCell";
        MoneyDetailCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"MoneyDetailCell" owner:self options:nil][0];
        }
        return cell;
    }else{
        
        static NSString* cellID = @"cellID";
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.textLabel.textColor = WTTextColor;
            cell.textLabel.font = [UIFont systemFontOfSize:14];
        }
        if (indexPath.row == 0) {
            cell.textLabel.text = @"订单状态：未支付";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"订单编号：458216522";
        }
        return cell;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else{
        return 1;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 8)];
    view.backgroundColor = WTBackGroundColor;
    return view;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1){
        return 96;
    }else if (indexPath.section == 2){
        return 90;
    }else if (indexPath.section == 3){
        return 130;
    }else if (indexPath.section == 4){
        return 114;
    }else{
        return 44;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        WTAddressController* vc = [[WTAddressController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 3) {
        WTArtListController* vc = [[WTArtListController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView)
    {
        CGFloat sectionHeaderHeight = 8; //sectionHeaderHeight
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
