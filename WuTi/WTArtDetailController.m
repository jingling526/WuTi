//
//  WTArtDetailController.m
//  WuTi
//
//  Created by Uekimu on 16/5/20.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTArtDetailController.h"
#import "ArtDetailView.h"
#import "LabelView.h"
#import "WTShoppingCarController.h"
#import "ArtistDetailView.h"

@interface WTArtDetailController ()
@property(nonatomic,weak)UIImageView* indicator;
@property(nonatomic,weak)UIScrollView* scrollView;
@property(nonatomic,weak)UIView* leftView;
@property(nonatomic,weak)UIView* rightView;
@end

@implementation WTArtDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.view.backgroundColor = WTBackGroundColor;
    [self getData];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getData{
    UIScrollView* scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-50)];
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    ArtDetailView* view = [[NSBundle mainBundle]loadNibNamed:@"ArtDetailView" owner:nil options:nil][0];
    view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 412);
    [_scrollView addSubview:view];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"中国",@"水墨画",@"风景",@"冬",nil];
    
    LabelView *labelView = [[LabelView alloc] initWithFrame:CGRectMake(15, view.bottom, SCREEN_WIDTH-15, 50)];
    [labelView bindTags:array];
    [_scrollView addSubview:labelView];
    
    CALayer* line = [CALayer layer];
    line.frame = CGRectMake(0, labelView.bottom+16, SCREEN_WIDTH, 0.5);
    line.backgroundColor = UIColorFromRGB(0xDCDCDC).CGColor;
    [_scrollView.layer addSublayer:line];
    
    UIButton* leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitle:@"作品详情" forState:UIControlStateNormal];
    [leftBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    leftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    leftBtn.frame = CGRectMake(0, labelView.bottom+17, SCREEN_WIDTH/2, 43);
    leftBtn.tag = 1;
    [leftBtn addTarget:self action:@selector(changeDetail:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:leftBtn];
    
    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"艺术家介绍" forState:UIControlStateNormal];
    [rightBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    rightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    rightBtn.frame = CGRectMake(SCREEN_WIDTH/2, labelView.bottom+17, SCREEN_WIDTH/2, 43);
    rightBtn.tag = 2;
    [rightBtn addTarget:self action:@selector(changeDetail:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:rightBtn];
    
    UIImageView* indicator = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"箭头左"]];
    indicator.frame = CGRectMake(0, leftBtn.bottom, SCREEN_WIDTH, 9);
    [_scrollView addSubview:indicator];
    _indicator = indicator;
    
    UIView* leftView = [[UIView alloc]initWithFrame:CGRectMake(0, indicator.bottom, SCREEN_WIDTH, 360)];
    _leftView = leftView;
    
    ArtistDetailView* rightView = [[NSBundle mainBundle]loadNibNamed:@"ArtistDetailView" owner:self options:nil][0];
    rightView.frame = CGRectMake(0, indicator.bottom, SCREEN_WIDTH, 360);
    rightView.hidden = YES;
    _rightView = rightView;
    
    [_scrollView addSubview:leftView];
    [_scrollView addSubview:rightView];
    
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, leftView.bottom);
    
    UIView* bottomBar = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WIDTH, 50)];
    bottomBar.backgroundColor = UIColorFromRGB(0xFFFFFF);
    bottomBar.layer.borderWidth = 0.5;
    bottomBar.layer.borderColor = UIColorFromRGB(0xE6E6E6).CGColor;
    [self.view addSubview:bottomBar];
    
    UIButton* buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [buyBtn setImage:[UIImage imageNamed:@"收入囊中"] forState:UIControlStateNormal];
    [buyBtn setBackgroundColor:UIColorFromRGB(0x333333)];
    [buyBtn setTitle:@"  收入囊中" forState:UIControlStateNormal];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    buyBtn.frame = CGRectMake(SCREEN_WIDTH*0.6, SCREEN_HEIGHT-50, SCREEN_WIDTH*0.4, 50);
    [self.view addSubview:buyBtn];
    
    UIButton* dataBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [dataBtn setImage:[UIImage imageNamed:@"数据"] forState:UIControlStateNormal];
    [dataBtn setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateNormal];
    [dataBtn setTitle:@"  数据" forState:UIControlStateNormal];
    dataBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    dataBtn.frame = CGRectMake(0, 0, (SCREEN_WIDTH*0.6)/2, 50);
    [bottomBar addSubview:dataBtn];
    
    UIButton* trendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [trendBtn setImage:[UIImage imageNamed:@"趋势"] forState:UIControlStateNormal];
    [trendBtn setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateNormal];
    [trendBtn setTitle:@"  趋势" forState:UIControlStateNormal];
    trendBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    trendBtn.frame = CGRectMake((SCREEN_WIDTH*0.6)/2, 0, (SCREEN_WIDTH*0.6)/2, 50);
    [bottomBar addSubview:trendBtn];
    
    CALayer* layer = [CALayer layer];
    layer.frame = CGRectMake(dataBtn.right, 11, 0.5, 31);
    layer.backgroundColor = UIColorFromRGB(0xDCDCDC).CGColor;
    [bottomBar.layer addSublayer:layer];

}

-(void)changeDetail:(UIButton*)button{
    if (button.tag == 1) {
        _indicator.image = [UIImage imageNamed:@"箭头左"];
        _leftView.hidden = NO;
        _rightView.hidden = YES;
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, _leftView.bottom);
    }else{
        _indicator.image = [UIImage imageNamed:@"箭头右"];
        _leftView.hidden = YES;
        _rightView.hidden = NO;
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, _rightView.bottom);
    }
    
}

-(void)setupUI{
    UIButton* buyBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
    [buyBtn setImage:[UIImage imageNamed:@"购物车2"] forState:UIControlStateNormal];
    [buyBtn addTarget:self action:@selector(shoppingCar) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* buyBarBtn = [[UIBarButtonItem alloc]initWithCustomView:buyBtn];
    self.navigationItem.rightBarButtonItem = buyBarBtn;
    
    UIButton* likeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
    [likeBtn setImage:[UIImage imageNamed:@"喜欢"] forState:UIControlStateNormal];
    [likeBtn addTarget:self action:@selector(like) forControlEvents:UIControlEventTouchUpInside];
    likeBtn.imageEdgeInsets = UIEdgeInsetsMake(2, 0, 0, 0);
    UIBarButtonItem* likeBarBtn = [[UIBarButtonItem alloc]initWithCustomView:likeBtn];
    
    UIButton* shareBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
    [shareBtn setImage:[UIImage imageNamed:@"分享2"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* shareBarBtn = [[UIBarButtonItem alloc]initWithCustomView:shareBtn];
    
    UIButton* backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
    [backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    UIBarButtonItem* backBarBtn = [[UIBarButtonItem alloc]initWithCustomView:backBtn];

    self.navigationItem.leftBarButtonItems = @[backBarBtn,likeBarBtn,shareBarBtn];
    
}

-(void)back{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"refreshTab" object:nil];
}

-(void)shoppingCar{
    WTShoppingCarController* vc = [[WTShoppingCarController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)like{
    
}

-(void)share{
    
}

@end
