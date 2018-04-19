//
//  TheBeeCollectionViewCell.h
//  YunSiShang_2.0
//
//  Created by Ji_YuFeng on 2018/4/17.
//  Copyright © 2018年 Bee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TheBeeCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong)UILabel *content;

- (void)setTheLabeValueWithFont:(CGFloat)font textColor:(UIColor *)textColor borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius andContent:(NSString *)string;

@end
