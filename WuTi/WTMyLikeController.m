//
//  WTMyLikeController.m
//  WuTi
//
//  Created by Uekimu on 16/6/13.
//  Copyright © 2016年 UK. All rights reserved.
//

#import "WTMyLikeController.h"
#import "HMSegmentedControl.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "CHTCollectionViewWaterfallFooter.h"
#import "CHTCollectionViewWaterfallHeader.h"
#import "WTMainCollectionViewCell.h"
#import "WTArtDetailController.h"

@interface WTMyLikeController ()<UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, strong) HMSegmentedControl* segmentControl;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cats;

@end

#define CELL_COUNT 30
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"
#define CELL_BTM_HEIGHT 145

@implementation WTMyLikeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"喜欢";
    self.view.backgroundColor = WTBackGroundColor;
    [self.view addSubview:self.collectionView];
    [self setupUI];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
}

-(void)setupUI{
    self.segmentControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 48)];
    self.segmentControl.sectionTitles = @[@"艺术品",@"艺术家",@"话题",@"活动"];
    self.segmentControl.selectedSegmentIndex = 0;
    self.segmentControl.backgroundColor = [UIColor whiteColor];
    self.segmentControl.titleTextAttributes = @{NSForegroundColorAttributeName : UIColorFromRGB(0x999999),NSFontAttributeName:[UIFont systemFontOfSize:14]};
    self.segmentControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : UIColorFromRGB(0x333333)};
    self.segmentControl.selectionIndicatorColor = UIColorFromRGB(0x333333);
    self.segmentControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
    self.segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentControl.selectionIndicatorHeight = 2.5;
    self.segmentControl.selectionIndicatorBoxOpacity = 0;
    UIView* line = [[UIView alloc]initWithFrame:CGRectMake(0, 48-0.5, SCREEN_WIDTH, 0.5)];
    line.backgroundColor = UIColorFromRGB(0xDCDCDC);
    [self.segmentControl addSubview:line];
    
//    __weak typeof(self) weakSelf = self;
    [self.segmentControl setIndexChangeBlock:^(NSInteger index) {
        
    }];
    [self.view addSubview:self.segmentControl];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
        layout.headerHeight = 0;
        layout.footerHeight = 0;
        layout.minimumColumnSpacing = 15;
        layout.minimumInteritemSpacing = 15;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64+48, SCREEN_WIDTH, SCREEN_HEIGHT-64-48) collectionViewLayout:layout];
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
