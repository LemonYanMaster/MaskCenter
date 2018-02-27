//
//  PullListTextField.h
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/7.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ClickBlock)(NSInteger index);

@interface PullListTextField : UITextField
@property (nonatomic ,copy) ClickBlock clickBlock;
- (instancetype) initWithFrame:(CGRect)frame andRightImg:(NSString *)imageName;
- (void)addPullListWithDataSource:(NSArray *)titleArr withClickBlock:(ClickBlock)clickBlock;
@end
