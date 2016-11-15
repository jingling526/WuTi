//
//  WTDiscoverViewController.m
//  WuTi
//
//  Created by Uekimu on 16/5/12.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTDiscoverViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "CHTCollectionViewWaterfallFooter.h"
#import "CHTCollectionViewWaterfallHeader.h"
#import "WTMainCollectionViewCell.h"
#import "WTArtDetailController.h"
#import "WTFindTopView.h"
#import "UIImageView+LBBlurredImage.h"

@interface WTDiscoverViewController ()<UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cats;
@end

#define CELL_COUNT 30
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"
#define CELL_BTM_HEIGHT 145

@implementation WTDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WTBackGroundColor;
    [self.view addSubview:self.collectionView];
    [self setupUI];
    [self getData];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
}

-(void)getData{
    
}

-(void)setupUI{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    
    UITextField* searchTF = [[UITextField alloc]initWithFrame:CGRectMake(7, 0, SCREEN_WIDTH-65, 30)];
    searchTF.layer.cornerRadius = 3.0;
    searchTF.layer.borderWidth = 0.5;
    searchTF.layer.borderColor = UIColorFromRGB(0xDCDCDC).CGColor;
    searchTF.borderStyle = UITextBorderStyleNone;
    searchTF.leftViewMode = UITextFieldViewModeAlways;
    searchTF.placeholder = @"请输入您要搜索的内容";
    searchTF.font = [UIFont systemFontOfSize:12];
    searchTF.returnKeyType = UIReturnKeySearch;
    UIImageView* searchImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 36, 16)];
    searchImg.image = [UIImage imageNamed:@"搜索"];
    searchImg.contentMode = UIViewContentModeCenter;
    searchTF.leftView = searchImg;
    searchTF.centerY = view.height/2;
    searchTF.tintColor = [UIColor lightGrayColor];
    [view addSubview: searchTF];
    
    UIButton* scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [scanBtn setImage:[UIImage imageNamed:@"扫码"] forState:UIControlStateNormal];
    scanBtn.frame = CGRectMake(searchTF.right+10, 0, 30, 30);
    scanBtn.centerY = view.height/2;
    scanBtn.imageView.contentMode = UIViewContentModeCenter;
    [scanBtn addTarget:self action:@selector(scan) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:scanBtn];
    self.navigationItem.titleView = view;
    
    UITapGestureRecognizer *gestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gestureRecognizer2.cancelsTouchesInView = NO;
    [self.collectionView addGestureRecognizer:gestureRecognizer2];
    
}

-(void)scan{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)hideKeyboard{
    [self.navigationController.view endEditing:YES];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
        layout.headerHeight = 355+SCREEN_WIDTH/375*225;
        layout.footerHeight = 0;
        layout.minimumColumnSpacing = 15;
        layout.minimumInteritemSpacing = 15;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-49-64) collectionViewLayout:layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = self.view.backgroundColor;
        
        UINib *cellNib = [UINib nibWithNibName:@"WTMainCollectionViewCell" bundle:nil];
        [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"WTMainCollectionViewCell"];
    
        UINib *topNib = [UINib nibWithNibName:@"WTFindTopView" bundle:nil];
        [self.collectionView registerNib:topNib forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:HEADER_IDENTIFIER];
        [_collectionView registerClass:[CHTCollectionViewWaterfallFooter class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
                   withReuseIdentifier:FOOTER_IDENTIFIER];
    }
    return _collectionView;
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
