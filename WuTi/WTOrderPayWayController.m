//
//  WTOrderPayWayController.m
//  WuTi
//
//  Created by Uekimu on 16/5/26.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTOrderPayWayController.h"
#import "PayMethodCell.h"

@interface WTOrderPayWayController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;
@end

@implementation WTOrderPayWayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择支付方式";
    self.view.backgroundColor = WTBackGroundColor;
    
    [self setupUI];
    // Do any additional setup after loading the view.
}
-(void)setupUI{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = WTBackGroundColor;
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 8)];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    self.tableView.scrollEnabled = NO;
    self.tableView.rowHeight = 44;
    [self.view addSubview:self.tableView];
    
    UIView* bottombar = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WIDTH, 50)];
    bottombar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottombar];
    
    UILabel* tip = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 70, 13)];
    tip.text = @"支付金额：";
    tip.font = [UIFont systemFontOfSize:14];
    tip.textColor = WTTextColor;
    [bottombar addSubview:tip];
    
    UILabel* money = [[UILabel alloc]initWithFrame:CGRectMake(15, tip.bottom+8, SCREEN_WIDTH/2, 11)];
    money.text = @"¥1000.00";
    money.font = [UIFont systemFontOfSize:14];
    money.textColor = UIColorFromRGB(0xE43F36);
    [bottombar addSubview:money];

    UIButton* payButton = [UIButton buttonWithType:UIButtonTypeCustom];
    payButton.backgroundColor = WTTextColor;
    [payButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [payButton setTitle:@"立即支付" forState:UIControlStateNormal];
    payButton.titleLabel.font = [UIFont systemFontOfSize:14];
    payButton.layer.cornerRadius = 3;
    payButton.frame = CGRectMake(SCREEN_WIDTH-87-15, 9, 87, 34);
    [bottombar addSubview:payButton];
    
    NSIndexPath* path = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:path animated:NO scrollPosition:UITableViewScrollPositionNone];

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = @"PayMethodCell";
    PayMethodCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"PayMethodCell" owner:self options:nil][0];
    }
    if (indexPath.row == 0) {
        cell.title.text = @"支付宝支付";
    }
    if (indexPath.row == 1) {
        cell.title.text = @"微信支付";
    }
    if (indexPath.row == 2){
        cell.title.text = @"银联支付";
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
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
