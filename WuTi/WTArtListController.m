//
//  WTArtListController.m
//  WuTi
//
//  Created by Uekimu on 16/5/25.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTArtListController.h"
#import "ArtListDetailCell.h"

@interface WTArtListController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;
@end

@implementation WTArtListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WTBackGroundColor;
    self.navigationItem.title = @"艺术品清单";
    [self setupUI];
    // Do any additional setup after loading the view.
}

-(void)setupUI{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = WTBackGroundColor;
    [self.view addSubview:_tableView];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = @"ArtListDetailCell";
    ArtListDetailCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"ArtListDetailCell" owner:self options:nil][0];
    }
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
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
