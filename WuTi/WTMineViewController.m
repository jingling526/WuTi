//
//  WTMineViewController.m
//  WuTi
//
//  Created by Uekimu on 16/5/12.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTMineViewController.h"
#import "WTTabBarButton.h"
#import "WTShoppingCarController.h"
#import "WTMyOrderController.h"
#import "WTMyLikeController.h"

@interface MineButton : UIButton

@end

@implementation MineButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
        //文字的颜色
        [self setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [self setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateSelected];
        
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.75;
    return CGRectMake(0, 0, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height * 0.64;
    CGFloat titleW = contentRect.size.width;
    return CGRectMake(0, titleY, titleW, 12);
}

@end

@interface WTMineViewController ()
@property(nonatomic,strong)NSMutableArray* buttonArray;
@end

#define buttonWidth 50

@implementation WTMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WTBackGroundColor;
    _buttonArray = [NSMutableArray array];
    [self setupUI];
    [self setupBarItem];
    // Do any additional setup after loading the view.
}

-(void)setupBarItem{
    UIButton* settingBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
    [settingBtn setImage:[UIImage imageNamed:@"iconfont-shezhi"] forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(setting) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* settingBarBtn = [[UIBarButtonItem alloc]initWithCustomView:settingBtn];
    self.navigationItem.leftBarButtonItem = settingBarBtn;
    
    UIButton* messageBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
    [messageBtn setImage:[UIImage imageNamed:@"iconfont-youxiang"] forState:UIControlStateNormal];
    [messageBtn addTarget:self action:@selector(message) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* messageBarBtn = [[UIBarButtonItem alloc]initWithCustomView:messageBtn];
    self.navigationItem.rightBarButtonItem = messageBarBtn;
    self.navigationItem.title = @"我的";
}

-(void)setting{
    
}

-(void)message{
    
}

-(void)setupUI{
    
    
    UIView* topView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 188)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];

    UIImageView* photo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"头像2"]];
    photo.frame = CGRectMake(SCREEN_WIDTH/2-30, 15, 60, 60);
    photo.layer.cornerRadius = 30;
    [topView addSubview:photo];
    
    UILabel* name = [[UILabel alloc]initWithFrame:CGRectMake(0, photo.bottom+13, SCREEN_WIDTH, 14)];
    name.font = [UIFont systemFontOfSize:14];
    name.textColor = WTTextColor;
    name.textAlignment = NSTextAlignmentCenter;
    name.text = @"沈佳成";
    [topView addSubview:name];
    
    CGFloat offset = (SCREEN_WIDTH-3*50)/4;
    
    WTTabBarButton* button1 = [[WTTabBarButton alloc]init];
    [button1 setImage:[UIImage imageNamed:@"iconfont-gouwuche"] forState:UIControlStateNormal];
    [button1 setTitle:@"购物车" forState:UIControlStateNormal];
    button1.frame = CGRectMake(offset, topView.height-70, 50, 55);
    button1.tag = 1;
    [button1 addTarget:self action:@selector(topBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    WTTabBarButton* button2 = [[WTTabBarButton alloc]init];
    [button2 setImage:[UIImage imageNamed:@"积分 (2)"] forState:UIControlStateNormal];
    [button2 setTitle:@"积分" forState:UIControlStateNormal];
    button2.frame = CGRectMake(button1.right+offset, topView.height-70, 50, 55);
    button2.tag = 2;
    [button2 addTarget:self action:@selector(topBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    WTTabBarButton* button3 = [[WTTabBarButton alloc]init];
    [button3 setImage:[UIImage imageNamed:@"iconfont-dianzan"] forState:UIControlStateNormal];
    [button3 setTitle:@"喜欢" forState:UIControlStateNormal];
    button3.frame = CGRectMake(button2.right+offset, topView.height-70, 50, 55);
    button3.tag = 3;
    [button3 addTarget:self action:@selector(topBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [topView addSubview:button1];
    [topView addSubview:button2];
    [topView addSubview:button3];
    
    CALayer* layer1 = [CALayer layer];
    layer1.frame = CGRectMake((button1.centerX+button2.centerX)/2, 138, 0.5, 16);
    layer1.backgroundColor = UIColorFromRGB(0xDCDCDC).CGColor;
    [topView.layer addSublayer:layer1];
    
    CALayer* layer2 = [CALayer layer];
    layer2.frame = CGRectMake((button3.centerX+button2.centerX)/2, 138, 0.5, 16);
    layer2.backgroundColor = UIColorFromRGB(0xDCDCDC).CGColor;
    [topView.layer addSublayer:layer2];
    
    UIView* middleView = [[UIView alloc]initWithFrame:CGRectMake(0, topView.bottom+11, SCREEN_WIDTH, 181)];
    middleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:middleView];
    
    for (int i=0; i<4; i++) {
        for (int j=0; j<2; j++) {
            MineButton* button = [[MineButton alloc]init];
            button.frame = CGRectMake(i*SCREEN_WIDTH/4, j*90, SCREEN_WIDTH/4, 90);
            [middleView addSubview:button];
            button.tag = i+j*4;
            [button addTarget:self action:@selector(middleBtn:) forControlEvents:UIControlEventTouchUpInside];
            [_buttonArray addObject:button];
        }
    }
    
    for (MineButton* button in _buttonArray) {
        switch (button.tag) {
            case 0:
                [button setImage:[UIImage imageNamed:@"iconfont-dingdan"] forState:UIControlStateNormal];
                [button setTitle:@"我的订单" forState:UIControlStateNormal];
                break;
            case 1:
                [button setImage:[UIImage imageNamed:@"我的账号"] forState:UIControlStateNormal];
                [button setTitle:@"我的账号" forState:UIControlStateNormal];
                break;
            case 2:
                [button setImage:[UIImage imageNamed:@"iconfont-wodezujiline"] forState:UIControlStateNormal];
                [button setTitle:@"我的足迹" forState:UIControlStateNormal];
                break;
            case 3:
                [button setImage:[UIImage imageNamed:@"iconfont-ceping"] forState:UIControlStateNormal];
                [button setTitle:@"艺术测评" forState:UIControlStateNormal];
                break;
            case 4:
                [button setImage:[UIImage imageNamed:@"iconfont-women"] forState:UIControlStateNormal];
                [button setTitle:@"关于我们" forState:UIControlStateNormal];
                break;
            case 5:
                [button setImage:[UIImage imageNamed:@"专家"] forState:UIControlStateNormal];
                [button setTitle:@"专家顾问" forState:UIControlStateNormal];
                break;
            case 6:
                [button setImage:[UIImage imageNamed:@"jiaruwomen"] forState:UIControlStateNormal];
                [button setTitle:@"加入我们" forState:UIControlStateNormal];
                break;
            case 7:
                [button setImage:[UIImage imageNamed:@"iconfont-11"] forState:UIControlStateNormal];
                [button setTitle:@"我的转卖" forState:UIControlStateNormal];
                break;
            
            default:
                break;
        }
    }
    
    CALayer* horizonLine = [CALayer layer];
    horizonLine.frame = CGRectMake(0, middleView.height/2, SCREEN_WIDTH, 0.5);
    horizonLine.backgroundColor = UIColorFromRGB(0xDCDCDC).CGColor;
    [middleView.layer addSublayer:horizonLine];
    
    for (int i = 1; i<4; i++) {
        CALayer* verticalLine = [CALayer layer];
        verticalLine.frame = CGRectMake(i*SCREEN_WIDTH/4, 0, 0.5, middleView.height);
        verticalLine.backgroundColor = UIColorFromRGB(0xDCDCDC).CGColor;
        [middleView.layer addSublayer:verticalLine];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)topBtn:(UIButton*)button{
    switch (button.tag) {
        case 1://购物车
        {
            WTShoppingCarController* vc = [[WTShoppingCarController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2://积分
            break;
        case 3://喜欢
        {
            WTMyLikeController* vc = [[WTMyLikeController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

-(void)middleBtn:(UIButton*)button{
    switch (button.tag) {
        case 0://我的订单
        {
            WTMyOrderController* vc = [[WTMyOrderController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1://我的账号
            break;
        case 2://我的足迹
            break;
        case 3://艺术测评
            break;
        case 4://关于我们
            break;
        case 5://专家顾问
            break;
        case 6://加入我们
            break;
        case 7://我的转卖
            break;
        
        default:
            break;
    }
    
}

@end
