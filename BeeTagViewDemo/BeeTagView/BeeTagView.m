//
//  BeeTagView.m
//  YunSiShang_2.0
//
//  Created by Ji_YuFeng on 2018/4/18.
//  Copyright © 2018年 Bee. All rights reserved.
//

#import "BeeTagView.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "TheBeeCollectionViewCell.h"

#import <Masonry/Masonry.h>

@interface BeeTagView () <UICollectionViewDataSource,UICollectionViewDelegate>
{
    float _collectionViewHeight; // 高度
    UIColor *_textColor; // 文字颜色
    UIColor *_cellColor; // cell背景颜色
    UIColor *_cellBorderColor; // cell边框颜色
    
}

@property (nonatomic,strong)UICollectionView *myCollectionView;
@property (nonatomic,strong)UICollectionViewLeftAlignedLayout *layout;
@property (nonatomic,strong)NSArray *tagArr;

@end

@implementation BeeTagView

- (UICollectionView *)myCollectionView
{
    if (!_myCollectionView) {
        _layout = [[UICollectionViewLeftAlignedLayout alloc]init];
        _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:_layout];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        // 1.设置列间距
        _layout.minimumInteritemSpacing = self.minitemSpace;
        // 2.设置行间距
        _layout.minimumLineSpacing = self.minlineSpace;
        
        _myCollectionView.backgroundColor = [UIColor clearColor];
        [_myCollectionView registerClass:[TheBeeCollectionViewCell class] forCellWithReuseIdentifier:@"TheBeeCollectionViewCell"];
    }
    return _myCollectionView;
}

- (id)initWithTextArr:(NSArray *)textArr TextColor:(UIColor *)textColor CellBackColor:(UIColor *)cellBackColor CellBorderColor:(UIColor *)borderColor
{
    if (self = [super init]) {
        _collectionViewHeight = 0;
        self.collectionViewMaxHeight = MAXFLOAT;
        
        _textColor = textColor;
        _cellColor = cellBackColor;
        _cellBorderColor = borderColor;
        
        if (borderColor) {
            self.cellBorderWidth = 1;
        }else{
            self.cellBorderWidth = 0;
        }
        
        self.tagArr = textArr;
        self.edgeInset = UIEdgeInsetsMake(5, 5, 5, 5);
        self.minitemSpace = 5;
        self.minlineSpace = 5;
        self.textInterval = 8;
        self.cellHeight = 30;
        self.cellCornerRadius = 0;
        self.textFont = 14;
        
        [self addSubview:self.myCollectionView];
        [self.myCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
        
        [self performSelector:@selector(returnTheContentViewHeight) withObject:nil afterDelay:0.1];
        
    }
    
    return self;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tagArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TheBeeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TheBeeCollectionViewCell" forIndexPath:indexPath];
    
    cell.backgroundColor = _cellColor;
    [cell setTheLabeValueWithFont:_textFont textColor:_textColor borderWidth:self.cellBorderWidth borderColor:_cellBorderColor cornerRadius:self.cellCornerRadius andContent:self.tagArr[indexPath.row]];
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    CGSize thesize = [self.tagArr[indexPath.row] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_textFont]}];
    return CGSizeMake(thesize.width + self.textInterval*2, self.cellHeight);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return self.edgeInset;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *theString = self.tagArr[indexPath.row];
    if (self.didselectBlock) {
        self.didselectBlock(indexPath.row, theString);
    }
}


#pragma mark - 拿到高度
- (void)returnTheContentViewHeight
{
    CGSize thesize = self.myCollectionView.contentSize;
    if (self.heightBlock) {
        self.heightBlock(thesize.height);
    }
}


@end
