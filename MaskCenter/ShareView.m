//
//  ShareView.m
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/8.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//

#import "ShareView.h"
@interface ShareView ()<UICollectionViewDelegate,UICollectionViewDataSource>
/** 自定义 */
@property (nonatomic ,assign) BOOL needShowHeader;
/** 自定义 */
@property (nonatomic ,strong) NSArray *platforms;
/** 自定义 */
@property (nonatomic ,strong) NSArray *logos;
@end

@implementation ShareView

+ (instancetype)shareViewWithShowHeader:(BOOL)showHeader{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 3, 103);
    flowLayout.sectionInset = UIEdgeInsetsZero;
    
    CGFloat height = flowLayout.itemSize.height * 2;
    if (showHeader) {
        flowLayout.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 36);
        height += flowLayout.headerReferenceSize.height;
    }
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height);
    
    ShareView *shareView = [[self alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    shareView.canShowShareView = NO;
    shareView.needShowHeader = showHeader;
    return shareView;
}

- (instancetype) initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate   = self;
        self.needShowHeader = NO;
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.platforms.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //TODO
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //获取
    NSString *platform = [self platformStringFromIndexpath:indexPath.row];
    if (self.shareDelegate && [self.shareDelegate respondsToSelector:@selector(selecshareView:didSelectItem:)]) {
        [self.shareDelegate selecshareView:self didSelectItem:platform];
//        - (void)selecshareView:(ShareView *)shareView didSelectItem:(NSString *)platform;
    }
}

- (NSString *)platformStringFromIndexpath:(NSInteger )integer{
   //TODO
    return nil;
}

- (NSArray *)platforms{
    if (!_platforms) {
        
    }
    return _platforms;
}

- (NSArray *)logos{
    if (!_logos) {
        
    }
    return _logos;
}

@end
