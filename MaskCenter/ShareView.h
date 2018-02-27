//
//  ShareView.h
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/8.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShareView;

@protocol ShareViewDelegate <NSObject>
- (void)selecshareView:(ShareView *)shareView didSelectItem:(NSString *)platform;
@end



@interface ShareView : UICollectionView

@property (nonatomic, weak)  id<ShareViewDelegate>shareDelegate;
/** 自定义 */
@property (nonatomic ,assign) BOOL canShowShareView;
+ (instancetype)shareViewWithShowHeader:(BOOL)showHeader;

@end
