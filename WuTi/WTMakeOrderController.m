//
//  WTMakeOrderController.m
//  WuTi
//
//  Created by Uekimu on 16/5/24.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTMakeOrderController.h"
#import "OrderAddressCell.h"
#import "WTOptionCell.h"
#import "WTOption2Cell.h"
#import "ArtListCell.h"
#import "WTAddressController.h"
#import "WTArtListController.h"
#import "WTPayMethodController.h"

@interface WTMakeOrderController ()<UITableViewDelegate,UITableViewDataSource,WTOptionDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,copy)NSString* payMethod;
@end

@implementation WTMakeOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"填写订单";
    self.view.backgroundColor = WTBackGroundColor;
    [self setupUI];
    _payMethod = @"支付宝";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getPayMethod:) name:@"payMethod" object:nil];
    // Do any additional setup after loading the view.
}


-(void)setupUI{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-50-64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = WTBackGroundColor;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 8)];
    [self.view addSubview:_tableView];
    
    UIView* bottomBar = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WIDTH, 50)];
    bottomBar.backgroundColor = UIColorFromRGB(0xFFFFFF);
    bottomBar.layer.borderWidth = 0.5;
    bottomBar.layer.borderColor = UIColorFromRGB(0xE6E6E6).CGColor;
    [self.view addSubview:bottomBar];
    
    UIButton* buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [buyBtn setBackgroundColor:UIColorFromRGB(0x333333)];
    [buyBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    buyBtn.frame = CGRectMake(SCREEN_WIDTH*0.6, SCREEN_HEIGHT-50, SCREEN_WIDTH*0.4, 50);
    [buyBtn addTarget:self action:@selector(makeOrder) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buyBtn];

    UILabel* total = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 65, 50)];
    total.text = @"应付余额：";
    total.textColor = UIColorFromRGB(0x999999);
    total.font = [UIFont systemFontOfSize:14];
    CGRect frame = [total.text boundingRectWithSize:CGSizeMake(1000, 50) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:total.font} context:nil];
    total.width = frame.size.width;
    [bottomBar addSubview:total];
    
    UILabel* totalNum = [[UILabel alloc]initWithFrame:CGRectMake(total.right, 0, buyBtn.x-total.right, 50)];
    totalNum.text = @"¥11500.00";
    totalNum.textColor = UIColorFromRGB(0xF16622);
    totalNum.font = [UIFont systemFontOfSize:14];
    [bottomBar addSubview:totalNum];

}

-(void)makeOrder{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"订单将保留15:00，请尽快前往个人中心我的订单再次支付，超时将自动取消。" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alert show];
}

-(void)refreshView{
    [self.tableView reloadData];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        static NSString* cellID = @"AddressCell";
        OrderAddressCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"OrderAddressCell" owner:self options:nil][0];
        }
        return cell;
    }else if(indexPath.section == 2){
        static NSString* cellID = @"OptionCell";
        WTOptionCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"WTOptionCell" owner:self options:nil][0];
        }
        if (indexPath.row == 0) {
            cell.title.text = @"支付方式";
            cell.detail.text = _payMethod;
        }
        if (indexPath.row == 1) {
            cell.title.text = @"发票信息";
            cell.detail.text = @"不需要发票";
        }
        if (indexPath.row == 2) {
            cell.title.text = @"配送方式";
            cell.detail.text = @"卖家包邮";
        }
        return cell;
    }else if(indexPath.section == 3){
        static NSString* cellID = @"Option2Cell";
        WTOption2Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"WTOption2Cell" owner:self options:nil][0];
        }
        if (indexPath.row == 0) {
            cell.title.text = @"商品总额";
            cell.detail.text = @"¥500.00";
        }
        if (indexPath.row == 1) {
            cell.title.text = @"运费";
            cell.detail.text = @"¥0.00";
        }
        return cell;
    }else{
        static NSString* cellID = @"ArtListCell";
        ArtListCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"ArtListCell" owner:self options:nil][0];
        }
        cell.imageArray = @[@"20081119204358972_2",@"20081119204358972_2",@"20081119204358972_2",@"20081119204358972_2",@"20081119204358972_2"];
        return cell;
    }

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return 1;
    }else if (section == 2){
        return 3;
    }else{
        return 2;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 96;
    }else if(indexPath.section == 1){
        return 130;
    }else{
        return 44;
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 8)];
    header.backgroundColor = WTBackGroundColor;
    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        WTAddressController* vc = [[WTAddressController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 1) {
        WTArtListController* vc = [[WTArtListController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            WTPayMethodController* vc = [[WTPayMethodController alloc]init];
            vc.delegate = self;
            vc.payMethod = self.payMethod;
            [self.navigationController pushViewController:vc animated:YES];
        }
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


-(void)getPayMethod:(NSNotification*)noti{
    NSDictionary *dic = noti.userInfo;
    NSString* str = [dic objectForKey:@"name"];
    _payMethod = [str substringToIndex:[str length]-2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
