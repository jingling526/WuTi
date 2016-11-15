//
//  WTShoppingCarController.m
//  WuTi
//
//  Created by Uekimu on 16/5/23.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTShoppingCarController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "CHTCollectionViewWaterfallFooter.h"
#import "WTMainCollectionViewCell.h"
#import "WTArtDetailController.h"
#import "WTShoppingCarTopView.h"
#import "WTMakeOrderController.h"

@interface WTShoppingCarController ()<UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cats;
@property (nonatomic, weak) UITableView* tableView;

@end

#define CELL_COUNT 30
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"
#define CELL_BTM_HEIGHT 145

@implementation WTShoppingCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WTBackGroundColor;
    self.navigationItem.title = @"购物车";
    [self.view addSubview:self.collectionView];
    [self setupUI];
    [self setupBarItem];
    // Do any additional setup after loading the view.
}

-(void)setupBarItem{
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit)];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)setupUI{
    UIView* bottomBar = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WIDTH, 50)];
    bottomBar.backgroundColor = UIColorFromRGB(0xFFFFFF);
    bottomBar.layer.borderWidth = 0.5;
    bottomBar.layer.borderColor = UIColorFromRGB(0xE6E6E6).CGColor;
    [self.view addSubview:bottomBar];
    
    UIButton* buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [buyBtn setBackgroundColor:UIColorFromRGB(0x333333)];
    [buyBtn setTitle:@"去结算" forState:UIControlStateNormal];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    buyBtn.frame = CGRectMake(SCREEN_WIDTH*0.6, SCREEN_HEIGHT-50, SCREEN_WIDTH*0.4, 50);
    [buyBtn addTarget:self action:@selector(makeOrder) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buyBtn];
    
    UIButton* selectAllBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectAllBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [selectAllBtn setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateNormal];
    [selectAllBtn setTitle:@"  全选" forState:UIControlStateNormal];
    [selectAllBtn setImage:[UIImage imageNamed:@"椭圆 1"] forState:UIControlStateNormal];
    [selectAllBtn setImage:[UIImage imageNamed:@"椭圆 1 拷贝 3"] forState:UIControlStateSelected];
    selectAllBtn.frame = CGRectMake(0, 0, 80, 50);
    [selectAllBtn addTarget:self action:@selector(chooseAll:) forControlEvents:UIControlEventTouchUpInside];
    [bottomBar addSubview:selectAllBtn];
    
    UILabel* totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(selectAllBtn.right, 0, buyBtn.x-selectAllBtn.right, 50)];
    totalLabel.text = @"合计：¥15000";
    totalLabel.textColor = WTTextColor;
    totalLabel.font = [UIFont systemFontOfSize:14];
    [bottomBar addSubview:totalLabel];

}

-(void)makeOrder{
    
    WTMakeOrderController* vc = [[WTMakeOrderController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)edit{
    
}

-(void)chooseAll:(UIButton*)button{
    button.selected = !button.selected;
    if (button.selected) {
        for (int row =0; row<3; row++ ){
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
            [self.tableView selectRowAtIndexPath:indexPath
                                        animated:NO
                                  scrollPosition:UITableViewScrollPositionNone];
        }
    }else{
        for (int row =0; row<3; row++ ){
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        }
    }
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
        layout.headerHeight = 3*140+35;
        layout.footerHeight = 0;
        layout.minimumColumnSpacing = 15;
        layout.minimumInteritemSpacing = 15;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-50) collectionViewLayout:layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = self.view.backgroundColor;
        
        UINib *cellNib = [UINib nibWithNibName:@"WTMainCollectionViewCell" bundle:nil];
        [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"WTMainCollectionViewCell"];
        
        [_collectionView registerClass:[WTShoppingCarTopView class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
                   withReuseIdentifier:HEADER_IDENTIFIER];
        [_collectionView registerClass:[CHTCollectionViewWaterfallFooter class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
                   withReuseIdentifier:FOOTER_IDENTIFIER];
    }
    return _collectionView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)cellSizes {
    CGFloat width;
    
    width = (SCREEN_WIDTH-45)/2;
    
    if (!_cellSizes) {
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
        WTShoppingCarTopView* topView = (WTShoppingCarTopView*)reusableView;
        self.tableView = topView.tableView;
    
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
