//
//  WTPayMethodController.m
//  WuTi
//
//  Created by Uekimu on 16/5/26.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTPayMethodController.h"
#import "PayMethodCell.h"

@interface WTPayMethodController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;
@end

@implementation WTPayMethodController

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
    self.tableView.tableFooterView = [self footerView];
    self.tableView.rowHeight = 44;
    self.tableView.scrollEnabled = NO;
    [self.view addSubview:self.tableView];
}

-(UIView*)footerView{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    view.backgroundColor = WTBackGroundColor;
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button setTitle:@"确认" forState:UIControlStateNormal];
    [button setBackgroundColor:UIColorFromRGB(0x333333)];
    button.layer.cornerRadius = 3.0;
    button.frame = CGRectMake(15, 55, SCREEN_WIDTH-30, 46);
    [button addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return view;
}

-(void)confirm{
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    PayMethodCell *cell = (PayMethodCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    NSString* method = cell.title.text;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"payMethod" object:self userInfo:@{@"name":method}];
    [self.delegate refreshView];
    [self.navigationController popViewControllerAnimated:YES];
    
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
    if ([[cell.title.text substringToIndex:[cell.title.text length]-2]isEqualToString:self.payMethod]) {
        [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
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
