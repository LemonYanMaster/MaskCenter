//
//  MaskCenterView.h
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/4.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaskCenterView : UIView

@property (nonatomic ,strong) UIView *contentView;
- (void)hiddenAnimation:(BOOL)animation;
- (void)showContent:(UIView *)contentView;
@end
