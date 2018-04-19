//
//  BeeViewController.m
//  BeeTagViewDemo
//
//  Created by Ji_YuFeng on 2018/4/19.
//  Copyright © 2018年 Ji_YuFeng. All rights reserved.
//

#import "BeeViewController.h"
#import <Masonry.h>
#import "BeeTagView.h"

#if __has_feature(objc_arc)
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#else
#define WS(weakSelf)  __block __typeof(&*self)weakSelf = self;
#endif

@interface BeeViewController ()

@property (nonatomic,strong)BeeTagView *beetagView;

@end

@implementation BeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *textArr = @[@"风景",@"女装",@"专业岗位",@"休闲风",@"职业风",@"潮流",@"动态分享",@"纺织类",@"可爱"];
    
    _beetagView = [[BeeTagView alloc]initWithTextArr:textArr TextColor:[UIColor grayColor] CellBackColor:nil CellBorderColor:[UIColor grayColor]];
    _beetagView.cellCornerRadius = 5;
    _beetagView.backgroundColor = [UIColor colorWithRed:249/255.0 green:198/255.0 blue:44/255.0 alpha:0.2];
    WS(weakSelf);
    _beetagView.heightBlock = ^(CGFloat height) {
        [weakSelf.beetagView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(height);
        }];
    };
    _beetagView.didselectBlock = ^(NSInteger theindex, NSString *textString) {
        NSLog(@"%ld,%@",(long)theindex,textString);
    };
    [self.view addSubview:_beetagView];
    [_beetagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(0);
    }];
    
}



@end
