//
//  CustmoerView.h
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/7.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^confirmBlock)();

@interface CustmoerView : UIView
@property (nonatomic ,copy) confirmBlock  confirmBlock;
- (instancetype) initWithConfirmBlock:(confirmBlock)confirmBlock;
@end
