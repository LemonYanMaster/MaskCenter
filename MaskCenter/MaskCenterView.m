//
//  MaskCenterView.m
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/4.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//

#import "MaskCenterView.h"
@interface MaskCenterView ()

@end

@implementation MaskCenterView

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultConfig];
    }
    return self;
}

- (void)defaultConfig{
    UIColor *color = [UIColor blackColor];
    self.backgroundColor = [color colorWithAlphaComponent:0.5];
}

- (void)showContent:(UIView *)contentView{
    if (self.contentView) {
        [self.contentView removeFromSuperview];
    }
    self.contentView = contentView;
    self.contentView.layer.cornerRadius = 5.0;
    self.contentView.layer.masksToBounds = YES;
    self.contentView.transform = CGAffineTransformMakeScale(0.25, 0.25);
    [self addSubview:self.contentView];
    self.contentView.center = self.center;
    [self show];
}

- (void)hiddenAnimation:(BOOL)animation{
  [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
      self.alpha = 0;
      self.contentView.transform = CGAffineTransformMakeScale(0.25, 0.25);
  } completion:^(BOOL finished) {
      if (self.contentView) {
         [self.contentView removeFromSuperview];
      }
      [self removeFromSuperview];
  }];
 
}

- (void)show{
  [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionLayoutSubviews |UIViewAnimationOptionCurveLinear animations:^{
      self.alpha = 1.0f;
      self.contentView.transform = CGAffineTransformIdentity;
  } completion:nil];
}

@end
