//
//  DisplayView.m
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/7.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//

#import "DisplayView.h"
@interface DisplayView ()
/** 自定义注意事项 */
@property (nonatomic ,strong) UILabel  *needAttentionL;
/** 自定义支持范围 */
@property (nonatomic ,strong) UIButton *supprotScopeBtn;
/** 自定义 */
@property (nonatomic ,strong) UIImageView *imageV;
@end
@implementation DisplayView

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutSubViews];
        [self initContrains];
    }
    return self;
}

-(void)setStatesType:(DisplayViewStatesType)statesType{
    _statesType = statesType;
    [self addSubview:self.accLable];
    [self addSubview:self.needAttentionL];
    [self addSubview:self.imageV];
}

- (void)layoutSubViews{
  
}

- (void)initContrains{

}

@end
