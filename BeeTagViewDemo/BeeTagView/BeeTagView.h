//
//  BeeTagView.h
//  YunSiShang_2.0
//
//  Created by Ji_YuFeng on 2018/4/18.
//  Copyright © 2018年 Bee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ReturnTheHeightBlock)(CGFloat height);
typedef void (^CollectionViewDidSelectBlock)(NSInteger theindex,NSString *textString);

@interface BeeTagView : UIView

@property (nonatomic,assign) UIEdgeInsets edgeInset; // collectionView 的内边距
@property (nonatomic,assign) float minitemSpace; // 列间距
@property (nonatomic,assign) float minlineSpace; // 行间距
@property (nonatomic,assign) float textInterval; // 文字左右距离
@property (nonatomic,assign) float cellHeight; // cell的高度
@property (nonatomic,assign) float cellCornerRadius; // 边框弧度
@property (nonatomic,assign) float textFont; // 文字大小
@property (nonatomic,assign) float collectionViewMaxHeight; // 最高高度
@property (nonatomic,assign) float cellBorderWidth; // 边框大小

@property (nonatomic,copy) ReturnTheHeightBlock heightBlock; // block返回高度，在block里面更新一下约束/frame
@property (nonatomic,copy) CollectionViewDidSelectBlock didselectBlock; // 点击cell

/**
 * textArr: 文字数组
 * textColor: 文字颜色
 * cellBackColor: item背景颜色
 * borderColor: item边框颜色
 */
- (id)initWithTextArr:(NSArray *)textArr TextColor:(UIColor *)textColor CellBackColor:(UIColor *)cellBackColor CellBorderColor:(UIColor *)borderColor;

@end
