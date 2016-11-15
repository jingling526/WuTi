//
//  WTShoppingCarTopView.m
//  WuTi
//
//  Created by Uekimu on 16/5/23.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTShoppingCarTopView.h"
#import "WTShoppingCarCell.h"

@implementation WTShoppingCarTopView
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UITableView* tableView = [[UITableView alloc]initWithFrame:self.frame style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.allowsMultipleSelection = YES;
        UIView* footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 35)];
        footerView.backgroundColor = WTBackGroundColor;
        UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(0, 22, SCREEN_WIDTH, 13)];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = WTTextColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"为你推荐";
        [footerView addSubview:label];
        
        tableView.tableFooterView = footerView;
        [self addSubview:tableView];
        _tableView = tableView;
    }
    return self;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = @"WTShoppingCarCell";
    WTShoppingCarCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"WTShoppingCarCell" owner:self options:nil][0];
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

@end
