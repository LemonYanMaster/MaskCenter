//
//  InputView.m
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/8.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//
#import "Masonry.h"
#import "InputView.h"
@interface InputView ()<UITextFieldDelegate>

@end

@implementation InputView

- (instancetype) initWithFrame:(CGRect)frame ConfirmBlock:(confirmBlock)confirmBlock withCancelBlcok:(cancelBlock)cancelBlock{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.confirmBlock = confirmBlock;
        self.cancelBlock = cancelBlock;
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 100, 120);
        [self layoutSubViews];
        [self initContrians];
    }
    return self;
}

- (void)layoutSubViews{
    [self addSubview:self.passWordTF];
    [self addSubview:self.confirmBtn];
    [self addSubview:self.cancelBtn];
}

- (void)initContrians{
  [_passWordTF mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.equalTo(self.mas_top).offset(5);
      make.left.equalTo(self.mas_left).offset(20);
      make.right.equalTo(self.mas_right).offset(-20);
      make.top.mas_equalTo(20);
  }];
    [_confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_passWordTF);
        make.height.equalTo(@20);
        make.top.equalTo(_passWordTF.mas_bottom).offset(30);
        make.width.equalTo(_passWordTF.mas_width).multipliedBy(2.0/5);
    }];
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_passWordTF);
        make.top.height.width.equalTo(_confirmBtn);
    }];
}

#pragma mark - action
- (void)confirmAction:(UIButton *)btn{
    if (self.confirmBlock) {
        self.confirmBlock(self.passWordTF);
    }
}

- (void)cancelAction:(UIButton *)btn{
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}

#pragma mark - properties
- (UITextField *)passWordTF{
    if (!_passWordTF) {
        _passWordTF = [[UITextField alloc] init];
        _passWordTF.layer.borderColor = [UIColor grayColor].CGColor;
        _passWordTF.layer.borderWidth = 1.0f;
//        _passWordTF.delegate = self;
    }
    return _passWordTF;
}


- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [[UIButton alloc] init];
        [_confirmBtn setTitle:@"sure" forState:UIControlStateNormal];
        [_confirmBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_confirmBtn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] init];
        [_cancelBtn setTitle:@"cancel" forState:UIControlStateNormal];
        [_cancelBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    if (textField == self.passWordTF) {
//        return YES;
//    }
//    return NO;
//}

@end
