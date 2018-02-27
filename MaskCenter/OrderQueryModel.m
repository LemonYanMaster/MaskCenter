//
//  OrderQueryModel.m
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/8.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//
#import "Model.h"
#import "OrderQueryModel.h"
@interface OrderQueryModel ()
/** 自定义 */
@property (nonatomic ,strong) Model *model;
@end
@implementation OrderQueryModel

- (instancetype) initWithCount:(NSInteger)count withComplete:(completeBlock)complete{
    self = [super init];
    if (self) {
        self.model.count = count;
        self.model.number = self.number = 1;
        self.completeBlock = complete;
    }
    return self;
}

- (void)setDayType:(DayType)dayType{
    self.dayType = dayType;
    [self queryOrders];
}

- (void)queryServers{
   //TODO 
}

- (void)queryOrders{
    switch (self.dayType) {
        case DayType_Today:
            
            break;
        case DayType_Yesterday:
            break;
        case DayType_CustomTime:
            break;
            
        default:
            break;
    }
    [self queryOrders];
}

- (void) loadData{
    self.model.number = ++self.number;
    [self queryServers];
}

#pragma mark - propreties
- (Model *)model{
    if (!_model) {
        _model = [[Model alloc] init];
    }
    return _model;
}

- (NSMutableArray *)sections{
    if (!_sections) {
        _sections = [NSMutableArray array];
    }
    return _sections;
}

- (NSMutableArray *)oriData{
    if (!_oriData) {
        _oriData = [NSMutableArray array];
    }
    return _oriData;
}

- (NSMutableDictionary *)orders{
    if (!_orders) {
        _orders = [NSMutableDictionary dictionary];
    }
    return _orders;
}
@end
