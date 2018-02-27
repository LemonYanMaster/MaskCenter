//
//  ViewController.m
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/4.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//
#import "InputView.h"
#import "MaskCenterView.h"
//#import "CustmoerView.h"
#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
/** 自定义 */
@property (nonatomic ,strong) MaskCenterView *maskCenterView;
/** 自定义 */
//@property (nonatomic ,strong) CustmoerView   *custView;
/** 自定义 */
@property (nonatomic ,strong) InputView      *inputView;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.maskCenterView = [[MaskCenterView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
//    UIGestureRecognizer *gesTap = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTap)];
//    [self.maskCenterView addGestureRecognizer:gesTap];
//    gesTap.delegate = self;
    
//    self.custView = [[CustmoerView alloc] initWithConfirmBlock:^{
//        [self.maskCenterView hiddenAnimation:YES];
//        NSLog(@"==>ceshi");
//    }];
//    [self.maskCenterView showContent:self.custView];
//    [self.view addSubview:self.maskCenterView];
    
    
    
    self.inputView = [[InputView alloc] initWithFrame:CGRectZero ConfirmBlock:^(UITextField *passWord) {
        [self.maskCenterView hiddenAnimation:YES];
        NSLog(@"<===>%@",passWord.text);
    } withCancelBlcok:^{
        NSLog(@"cancel");
    }];
    [self.maskCenterView showContent:self.inputView];
    [self.view addSubview:self.maskCenterView];

}

- (void)gestureTap{
    [self.maskCenterView hiddenAnimation:YES];
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    if ([NSStringFromClass([touch.view class]) isEqualToString:@"CustmoerView"]) {
//        return NO;
//    }
//    return YES;
//    
    
//    if ([NSStringFromClass([touch.view class]) isEqualToString:@"InputView"]) {
//        return NO;
//    }
//    return YES;

//}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [super touchesBegan:touches withEvent:event];
//    [self.maskCenterView hiddenAnimation:YES];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
