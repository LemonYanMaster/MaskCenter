//
//  InputView.h
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/8.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void(^confirmBlock)(UITextField *passWord);
typedef void(^cancelBlock)();

@interface InputView : UIView
/** 自定义 */
@property (nonatomic ,strong) UITextField *passWordTF;
/** 自定义 */
@property (nonatomic ,strong) UIButton *confirmBtn;
/** 自定义 */
@property (nonatomic ,strong) UIButton *cancelBtn;
/** 自定义 */
@property (nonatomic ,copy)   confirmBlock confirmBlock;
/** 自定义 */
@property (nonatomic ,copy)   cancelBlock cancelBlock;

- (instancetype) initWithFrame:(CGRect)frame ConfirmBlock:(confirmBlock)confirmBlock withCancelBlcok:(cancelBlock)cancelBlock;

@end
