//
//  CustmoerView.m
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/7.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//
#import "Masonry.h"
#import "CustmoerView.h"
@interface CustmoerView ()
/** 自定义 */
@property (nonatomic ,strong) UILabel  *titleLabel;
/** 自定义 */
@property (nonatomic ,strong) UIView   *horizontaView;
/** 自定义 */
@property (nonatomic ,strong) UIButton *confirmBtn;
@end

@implementation CustmoerView

- (instancetype) initWithConfirmBlock:(confirmBlock)confirmBlock{
    self = [super init];
    if (self) {
        self.confirmBlock = confirmBlock;
        self.frame = CGRectMake(0, 0, 200, 105);
        self.backgroundColor = [UIColor whiteColor];
        [self layoutSubViews];
        [self initContrains];
    }
    return self;
}

- (void)layoutSubViews{
    [self addSubview:self.titleLabel];
    [self addSubview:self.horizontaView];
    [self addSubview:self.confirmBtn];
}

- (void)confirmAction:(UIButton *)btn{
    if (self.confirmBlock) {
        self.confirmBlock();
    }
}

- (void)initContrains{
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.equalTo(@56);
    }];
    [_horizontaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(_titleLabel.mas_bottom);
        make.height.equalTo(@1);
    }];
    [_confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(_horizontaView.mas_bottom);
        make.height.equalTo(@48);
    }];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"测试";
    }
    return _titleLabel;
}

- (UIView *)horizontaView{
    if (!_horizontaView) {
        _horizontaView = [[UIView alloc] init];
        _horizontaView.backgroundColor = [UIColor grayColor];
    }
    return _horizontaView;
}

- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [[UIButton alloc] init];
        [_confirmBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_confirmBtn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

@end
