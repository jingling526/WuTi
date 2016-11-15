//
//  WTAddressController.m
//  WuTi
//
//  Created by Uekimu on 16/5/25.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTAddressController.h"
#import "AddressCell.h"
#import "WTAddAddressController.h"

@interface WTAddressController ()<UITableViewDelegate,UITableViewDataSource,AddressCellDelegate>
@property (nonatomic,strong)UITableView* tableView;
@property (nonatomic,strong)NSMutableArray* dataArray;
@end

@implementation WTAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WTBackGroundColor;
    self.title = @"地址管理";
    [self getData];
    [self setupBarItem];
    [self setupUI];
    
    
    // Do any additional setup after loading the view.
}

-(void)setupBarItem{
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addAddress)];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)getData{
    _dataArray = [NSMutableArray array];
    for (int i = 0; i<12; i++) {
        [_dataArray addObject:@(NO)];
    }
    [_dataArray replaceObjectAtIndex:0 withObject:@(YES)];
    [self.tableView reloadData];
}

-(void)setupUI{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = WTBackGroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

-(void)addAddress{
    WTAddAddressController* vc = [[WTAddAddressController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = @"AddressCell";
    AddressCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"AddressCell" owner:self options:nil][0];
    }
    cell.delegate = self;
    cell.path = indexPath;
    cell.defaultBtn.selected = [_dataArray[indexPath.row] boolValue];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 124;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)editAddress{
    WTAddAddressController* vc = [[WTAddAddressController alloc]init];
    vc.name = @"王沐之";
    vc.phone = @"13545676535";
    vc.district = @"上海";
    vc.address = @"浦东新区胜康廖氏大厦商城路738号2203室";
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)deleteAddress:(NSIndexPath*)path{
    
    [_dataArray removeObjectAtIndex:path.row];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationLeft];
    
    for (int i=0; i<_dataArray.count; i++) {
        NSIndexPath* path = [NSIndexPath indexPathForRow:i inSection:0];
        AddressCell* cell = [self.tableView cellForRowAtIndexPath:path];
        cell.path = path;
    }
   
}

-(void)defaultAddress:(NSIndexPath*)path{
    for (int i = 0; i<_dataArray.count; i++) {
         [_dataArray replaceObjectAtIndex:i withObject:@(NO)];
    }
    [_dataArray replaceObjectAtIndex:path.row withObject:@(YES)];
    [_tableView reloadData];
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
