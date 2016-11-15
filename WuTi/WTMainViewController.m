//
//  WTMainViewController.m
//  WuTi
//
//  Created by Uekimu on 16/5/12.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTMainViewController.h"
#import "WTMainCollectionViewCell.h"
#import "CHTCollectionViewWaterfallHeader.h"
#import "CHTCollectionViewWaterfallFooter.h"
#import "WTArtDetailController.h"

@implementation MoreButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        
        //文字的颜色
        [self setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateNormal];
        [self setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateSelected];
    
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.7;
    return CGRectMake(0, 0, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height * 0.7;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY - 10;
    return CGRectMake(0, titleY, titleW, titleH);
}

@end

@interface WTMainViewController ()
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cats;

@property (nonatomic, strong) CHTCollectionViewWaterfallLayout *layout2Column;
@property (nonatomic, strong) CHTCollectionViewWaterfallLayout *layout1Column;

@property (nonatomic, strong) UIView* moreView;
@property (nonatomic, strong) UIView* blackView;

@property (nonatomic, weak) UIButton* switchBtn;

@end

#define CELL_COUNT 30
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"
#define CELL_BTM_HEIGHT 145

@implementation WTMainViewController

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
        layout.headerHeight = 0;
        layout.footerHeight = 0;
        layout.minimumColumnSpacing = 15;
        layout.minimumInteritemSpacing = 15;
        _layout2Column = layout;
        
        CHTCollectionViewWaterfallLayout *layout2 = [[CHTCollectionViewWaterfallLayout alloc] init];
        layout2.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
        layout2.headerHeight = 0;
        layout2.footerHeight = 0;
        layout2.minimumColumnSpacing = 15;
        layout2.minimumInteritemSpacing = 15;
        layout2.columnCount = 1;
        _layout1Column = layout2;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = self.view.backgroundColor;

        UINib *cellNib = [UINib nibWithNibName:@"WTMainCollectionViewCell" bundle:nil];
        [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"WTMainCollectionViewCell"];
        
        [_collectionView registerClass:[CHTCollectionViewWaterfallHeader class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
                   withReuseIdentifier:HEADER_IDENTIFIER];
        [_collectionView registerClass:[CHTCollectionViewWaterfallFooter class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
                   withReuseIdentifier:FOOTER_IDENTIFIER];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    // Do any additional setup after loading the view.
}

-(void)setupUI{
    self.view.backgroundColor = WTBackGroundColor;

    self.navigationItem.title=@"无题";
    [self.view addSubview:self.collectionView];
    [self setupBarItem];
}

-(void)setupBarItem{
    UIButton* switchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
    [switchBtn setImage:[UIImage imageNamed:@"切换按钮"] forState:UIControlStateNormal];
    [switchBtn setImage:[UIImage imageNamed:@"切换按钮2"] forState:UIControlStateSelected];
    [switchBtn addTarget:self action:@selector(switchView:) forControlEvents:UIControlEventTouchUpInside];
    _switchBtn = switchBtn;
    UIBarButtonItem* switchBarBtn = [[UIBarButtonItem alloc]initWithCustomView:switchBtn];
    
    UIButton* moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
    [moreBtn setImage:[UIImage imageNamed:@"更多按钮"] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(pressMore) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* moreBarBtn = [[UIBarButtonItem alloc]initWithCustomView:moreBtn];
    self.navigationItem.rightBarButtonItems = @[moreBarBtn,switchBarBtn];
}

- (UIView*)moreView{
    if (!_moreView) {
        UIView* moreView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 120)];
        moreView.backgroundColor = [UIColor whiteColor];
        
        MoreButton* scanBtn = [[MoreButton alloc]init];
        [scanBtn setImage:[UIImage imageNamed:@"扫一扫"] forState:UIControlStateNormal];
        [scanBtn setTitle:@"扫一扫" forState:UIControlStateNormal];
        
        MoreButton* buyBtn = [[MoreButton alloc]init];
        [buyBtn setImage:[UIImage imageNamed:@"购物车"] forState:UIControlStateNormal];
        [buyBtn setTitle:@"购物车" forState:UIControlStateNormal];
        
        MoreButton* messageBtn = [[MoreButton alloc]init];
        [messageBtn setImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
        [messageBtn setTitle:@"信息" forState:UIControlStateNormal];
        
        [moreView addSubview:scanBtn];
        [moreView addSubview:buyBtn];
        [moreView addSubview:messageBtn];
        
        [scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(42);
            make.height.mas_equalTo(62);
            make.centerY.equalTo(moreView.mas_centerY).offset(10);
        }];
        [buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(42);
            make.height.mas_equalTo(62);
            make.centerY.equalTo(moreView.mas_centerY).offset(10);
        }];
        [messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(42);
            make.height.mas_equalTo(62);
            make.centerY.equalTo(moreView.mas_centerY).offset(10);
        }];
        
        [moreView distributeSpacingHorizontallyWith:@[scanBtn,buyBtn,messageBtn]];
        
        UIButton* closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeBtn setImage:[UIImage imageNamed:@"取消"] forState:UIControlStateNormal];
        closeBtn.frame = CGRectMake(7, 7, 32, 32);
        [moreView addSubview:closeBtn];
        [closeBtn addTarget:self action:@selector(removeBlackView:) forControlEvents:UIControlEventTouchUpInside];
        
        _moreView = moreView;
        
    }
    return _moreView;
    
}

-(void)removeBlackView:(UITapGestureRecognizer*)gesture{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.blackView.alpha = 0;
        self.moreView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 120);
    } completion:^(BOOL finished) {
        [self.blackView removeFromSuperview];
        [self.moreView removeFromSuperview];
    }];
}

-(void)switchView:(UIButton*)button{
    button.selected = !button.selected;
    button.userInteractionEnabled = NO;
    _cellSizes = nil;
    if (button.selected) {
        [_collectionView setCollectionViewLayout:_layout1Column animated:YES completion:^(BOOL finished) {
            button.userInteractionEnabled = YES;
        }];
        [self.collectionView layoutIfNeeded];
    }else{
        [_collectionView setCollectionViewLayout:_layout2Column animated:YES completion:^(BOOL finished) {
            button.userInteractionEnabled = YES;
        }];
        [self.collectionView layoutIfNeeded];
    }
}

-(void)pressMore{
    
    UIView* blackView = [[UIView alloc]initWithFrame:self.view.bounds];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 0;
    self.blackView = blackView;
    
    [self.tabBarController.view addSubview:blackView];
    [self.tabBarController.view addSubview:self.moreView];
    
    [UIView animateWithDuration:0.2 animations:^{
        blackView.alpha = 0.7;
        self.moreView.frame = CGRectMake(0, SCREEN_HEIGHT-120, SCREEN_WIDTH, 120);
    }];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeBlackView:)];
    [blackView addGestureRecognizer:tap];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)cellSizes {
    
    if (!_cellSizes) {
        CGFloat width;
        if (_switchBtn.selected) {
            width = SCREEN_WIDTH-30;
        }else{
            width = (SCREEN_WIDTH-45)/2;
        }
        _cellSizes = @[
                       [NSValue valueWithCGSize:CGSizeMake(width, width*55/40+CELL_BTM_HEIGHT)],
                       [NSValue valueWithCGSize:CGSizeMake(width, width*665/1000+CELL_BTM_HEIGHT)],
                       [NSValue valueWithCGSize:CGSizeMake(width, width*689/1024+CELL_BTM_HEIGHT)],
                       [NSValue valueWithCGSize:CGSizeMake(width, width*427/640+CELL_BTM_HEIGHT)]
                       ];
    }
    return _cellSizes;
}

- (NSArray *)cats {
    if (!_cats) {
        _cats = @[@"cat1.jpg", @"cat2.jpg", @"cat3.jpg", @"cat4.jpg"];
    }
    return _cats;
}


#pragma mark - Life Cycle

- (void)dealloc {
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return CELL_COUNT;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"WTMainCollectionViewCell";

    WTMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:self.cats[indexPath.item % 4]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:HEADER_IDENTIFIER
                                                                 forIndexPath:indexPath];
    } else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:FOOTER_IDENTIFIER
                                                                 forIndexPath:indexPath];
    }
    
    return reusableView;
}



#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellSizes[indexPath.item % 4] CGSizeValue];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    WTArtDetailController* vc = [[WTArtDetailController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
