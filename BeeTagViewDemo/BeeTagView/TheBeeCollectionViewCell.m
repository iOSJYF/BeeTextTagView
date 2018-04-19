//
//  TheBeeCollectionViewCell.m
//  YunSiShang_2.0
//
//  Created by Ji_YuFeng on 2018/4/17.
//  Copyright © 2018年 Bee. All rights reserved.
//

#import "TheBeeCollectionViewCell.h"
#import <Masonry/Masonry.h>

#define BEE_FONT(a) [UIFont systemFontOfSize:a]

@implementation TheBeeCollectionViewCell

- (UILabel *)content
{
    if (!_content) {
        _content = [[UILabel alloc]init];
        _content.font = BEE_FONT(14);
        _content.textAlignment = 1;
    }
    return _content;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.content];
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
    }
    return self;
}

- (void)setTheLabeValueWithFont:(CGFloat)font textColor:(UIColor *)textColor borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius andContent:(NSString *)string
{
    _content.text = string;
    
    if (font) {
        _content.font = BEE_FONT(font);
    }
    if (textColor) {
        _content.textColor = textColor;
    }
    if (borderWidth) {
        self.layer.borderWidth = borderWidth;
    }
    if (borderColor) {
        self.layer.borderColor = borderColor.CGColor;
    }
    self.layer.cornerRadius = cornerRadius;
}



@end
