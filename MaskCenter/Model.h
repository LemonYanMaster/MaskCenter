//
//  Model.h
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/8.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//
#import "OrderQueryModel.h"
#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic ,strong) NSString  *TradeDateFrom;// 开始时间
@property (nonatomic ,strong) NSString  *TradeDateTo;// 结束时间
//@property (nonatomic ,assign) QueryStatus queryStatus;// 交易状态
@property (nonatomic ,assign) DayType dayType;//日期
@property (nonatomic ,assign) NSInteger number;//页数
@property (nonatomic ,assign) NSInteger count;//行数
@property (nonatomic, copy) NSString  *TxnNum;
@property (nonatomic, copy) NSString  *TxnCN;//交易类型
@property (nonatomic, copy) NSString  *Poundage;//手续费

@end
