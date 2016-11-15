//
//  WTMyOrderController.m
//  WuTi
//
//  Created by Uekimu on 16/5/27.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTMyOrderController.h"
#import "WTOrderDetailController.h"
#import "HMSegmentedControl.h"
#import "MyOrderCell.h"
#import "WTOrderPayWayController.h"

@interface WTMyOrderController ()<UITableViewDelegate,UITableViewDataSource,MyOrderCellDelegate>
@property(nonatomic,strong)HMSegmentedControl* segmentControl;
@property(nonatomic,strong)UITableView* tableView;
@end

@implementation WTMyOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    self.view.backgroundColor = WTBackGroundColor;
    [self setupUI];
    // Do any additional setup after loading the view.
}

-(void)setupUI{
    self.segmentControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 42)];
    self.segmentControl.sectionTitles = @[@"全部",@"待支付",@"待发货",@"售后"];
    self.segmentControl.selectedSegmentIndex = 0;
    self.segmentControl.backgroundColor = [UIColor whiteColor];
    self.segmentControl.titleTextAttributes = @{NSForegroundColorAttributeName : UIColorFromRGB(0x999999),NSFontAttributeName:[UIFont systemFontOfSize:14]};
    self.segmentControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : UIColorFromRGB(0x333333)};
    self.segmentControl.selectionIndicatorColor = UIColorFromRGB(0x333333);
    self.segmentControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
    self.segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentControl.selectionIndicatorHeight = 2.5;
    self.segmentControl.selectionIndicatorBoxOpacity = 0;
    UIView* line = [[UIView alloc]initWithFrame:CGRectMake(0, 42-0.5, SCREEN_WIDTH, 0.5)];
    line.backgroundColor = UIColorFromRGB(0xDCDCDC);
    [self.segmentControl addSubview:line];
   
    __weak typeof(self) weakSelf = self;
    [self.segmentControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.tableView reloadData];
    }];
    [self.view addSubview:self.segmentControl];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.segmentControl.bottom, SCREEN_WIDTH, SCREEN_HEIGHT-self.segmentControl.bottom) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = WTBackGroundColor;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 8)];
    [self.view addSubview:self.tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)whiteClicked:(NSInteger)type{
    
}

-(void)blackClicked:(NSInteger)type{
    if (type == 1) {
        WTOrderPayWayController* vc = [[WTOrderPayWayController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = @"MyOrderCell";
    MyOrderCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"MyOrderCell" owner:self options:nil][0];
    }
    cell.imageArray = @[@"20081119204358972_2",@"画",@"20081119204358972_2",@"画",@"20081119204358972_2"];
    cell.type = indexPath.row%4+1;
    cell.delegate = self;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 217;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WTOrderDetailController* vc = [[WTOrderDetailController alloc]init];
    vc.type = indexPath.row%4+1;
    [self.navigationController pushViewController:vc animated:YES];
}



@end
