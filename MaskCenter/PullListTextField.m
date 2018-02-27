//
//  PullListTextField.m
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/7.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//

#import "PullListTextField.h"

@interface PullListTextField ()<UITableViewDelegate,UITableViewDataSource>
/** 自定义TableView */
@property (nonatomic ,strong) UITableView *listTableView;
/** 自定义Btn */
@property (nonatomic ,strong) UIButton *coverBtn;
/** 自定义 */
@property (nonatomic ,strong) UIButton *rightBtn;
/** 自定义 */
@property (nonatomic ,strong) NSArray  *dataSource;
/** 自定义 */
@property (nonatomic ,strong) NSString *rightImgName;
@end

@implementation PullListTextField
- (instancetype) initWithFrame:(CGRect)frame andRightImg:(NSString *)imageName{
    self = [super initWithFrame:frame];
    if (self) {
        self.textAlignment = NSTextAlignmentRight;
        self.rightImgName = imageName;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
    self.rightView = self.rightBtn;
    self.rightViewMode = UITextFieldViewModeAlways;
    [self addSubview:self.coverBtn];
}

- (void)addPullListWithDataSource:(NSArray *)titleArr withClickBlock:(ClickBlock)clickBlock{
    self.dataSource = titleArr;
    self.clickBlock = clickBlock;
    self.text = [self.dataSource firstObject];
    if (self.superview) {
        [self.superview addSubview:self.listTableView];
    }
}

#pragma mark - action
- (void)chooseClick{
    if (self.listTableView.alpha) {
        [UIView animateWithDuration:0.25 animations:^{
            self.listTableView.alpha = 0;
            self.listTableView.frame = CGRectMake(self.frame.origin.x, CGRectGetMaxY(self.frame), CGRectGetWidth(self.frame), 0);
        } completion:nil];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            self.listTableView.alpha = 1.0f;
            self.listTableView.frame = CGRectMake(self.frame.origin.x, CGRectGetMaxY(self.frame), CGRectGetWidth(self.frame), (self.dataSource.count)*44);
        } completion:nil];
    }
}

#pragma mark - tableViewDelegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return  self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.text = self.dataSource[indexPath.row];
    [self chooseClick];
    if (self.clickBlock) {
        self.clickBlock(indexPath.row);
    }
}

#pragma mark - propreties
- (UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height)];
        if (self.rightImgName) {
            [_rightBtn setBackgroundImage:[UIImage imageNamed:self.rightImgName] forState:UIControlStateNormal];
        }
        [_rightBtn addTarget:self action:@selector(chooseClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

- (UIButton *)coverBtn{
    if (!_coverBtn) {
        _coverBtn = [[UIButton alloc] initWithFrame:self.bounds];
        [_coverBtn addTarget:self action:@selector(chooseClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _coverBtn;
}

- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, CGRectGetMaxY(self.frame), CGRectGetWidth(self.frame), 0) style:UITableViewStylePlain];
        _listTableView.scrollEnabled = NO;
        _listTableView.rowHeight = 44.0f;
        _listTableView.dataSource = self;
        _listTableView.delegate = self;
        _listTableView.layer.borderColor = [UIColor grayColor].CGColor;
        _listTableView.layer.borderWidth = 1.0f;
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_listTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
        _listTableView.backgroundColor = [UIColor clearColor];
    }
    return _listTableView;
}

@end
