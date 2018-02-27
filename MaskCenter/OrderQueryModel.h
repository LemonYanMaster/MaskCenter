//
//  OrderQueryModel.h
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/8.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, QueryStatus) {
    QueryStatus_Success,
    QueryStatus_LessthanCount,
    QueryStatus_Fail,
};

typedef NS_ENUM(NSInteger, DayType) {
    DayType_Today ,
    DayType_Yesterday,
    DayType_Last7day,
    DayType_CustomTime
};

//整个数据
typedef void(^completeBlock)(QueryStatus status,NSArray *section,NSMutableDictionary *orders);
@interface OrderQueryModel : NSObject

/** 自定义开始时间 */
@property (nonatomic ,strong) NSString *TradeDateFrom;
/** 自定义结束时间 */
@property (nonatomic ,strong) NSString *TradeDateTo;
/** 自定义页数 */
@property (nonatomic ,assign) NSInteger number;

@property (nonatomic ,assign) NSInteger *count;
/** 自定义交易状态 */
//@property (nonatomic ,assign) TradeDealerStatus DealerStatus;
@property (nonatomic ,assign) DayType dayType;//日期
/** 自定义单次请求数据数组 */
@property (nonatomic, strong) NSMutableArray    *oriData;
/** 自定义分区头数组 */
@property (nonatomic, strong) NSMutableArray    *sections;
/** 自定义所有数据字典 */
@property (nonatomic, strong) NSMutableDictionary *orders;

@property (nonatomic ,copy) completeBlock completeBlock;
- (instancetype) initWithCount:(NSInteger)count withComplete:(completeBlock)complete;
- (void) loadData;
@end
