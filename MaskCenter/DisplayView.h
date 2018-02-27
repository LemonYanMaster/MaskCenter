//
//  DisplayView.h
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/7.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DisplayViewStatesType){
    CheckStatesType_Domestic,
    CheckStatesType_Overseas,
};


@interface DisplayView : UIView

/** 自定义 */
@property (nonatomic ,strong) UILabel *accLable;
/** 自定义 */
@property (nonatomic ,assign) DisplayViewStatesType statesType;

@end
