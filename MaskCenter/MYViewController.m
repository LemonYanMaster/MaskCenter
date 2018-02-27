//
//  MYViewController.m
//  MaskCenter
//
//  Created by pengpeng yan on 2016/11/7.
//  Copyright © 2016年 pengpeng yan. All rights reserved.
//
#import "DetailCell.h"
#import "DetailsModle.h"
#import "MJRefresh.h"
#import "OrderQueryModel.h"
#import "PullListTextField.h"
#import "MYViewController.h"

@interface MYViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 自定义 */
@property (nonatomic ,strong) PullListTextField *pullTf1;
/** 自定义 */
@property (nonatomic ,strong) PullListTextField *pullTf2;
/** 自定义 */
@property (nonatomic ,strong) UITableView *pullTableView;
/** 自定义 */
@property (nonatomic ,strong) NSMutableArray *dataArray;
/** 自定义 */
@property (nonatomic ,strong) OrderQueryModel *orderModel;
/** 自定义 */
@property (nonatomic ,strong) NSMutableDictionary *Dic;
/** 自定义 */
@property (nonatomic ,strong) NSArray *sections;
/** 自定义 */
@property (nonatomic ,strong) MJRefreshNormalHeader *tableViewHeader;
/** 自定义 */
@property (nonatomic ,strong) MJRefreshBackNormalFooter *tableViewFooter;
@end

@implementation MYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pullTf1];
    [self.view addSubview:self.pullTf2];
    
    [self addPullList1];
    [self addPullList2];
    
    [self setupHeader];
    [self setupFooter];
    
    self.orderModel.dayType = DayType_Today;
}

- (void)setupHeader{
   self.tableViewHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       //TODO
       [self reloadMoreData];
   }];
    self.pullTableView.mj_header = self.tableViewHeader;
}

- (void)setupFooter{
   self.tableViewFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       //TODO
       [self reloadMoreData];
   }];
    self.pullTableView.mj_footer = self.tableViewFooter;
}

//TODO
- (void)reloadMoreData{
    [self.orderModel loadData];
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = self.sections[section];
    NSArray *arr = (NSArray *)self.Dic[key];
    return arr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return self.orderModel.sections.count;
    return self.sections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsModle *detailModel = [self.Dic objectForKey:self.sections[indexPath.section]][indexPath.row];
//TODO
//    return cell;
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.orderModel.sections[section];
    
}
//根据传入的
- (OrderQueryModel *)orderModel{
    NSInteger count = ([UIScreen mainScreen].bounds.size.height - 108) / 44 ;
    if (!_orderModel) {
        _orderModel = [[OrderQueryModel alloc] initWithCount:count withComplete:^(QueryStatus status, NSArray *section, NSMutableDictionary *orders) {
            //TODO  得到的数据存起来
            self.Dic = orders;
            self.sections = section;
            [self displayTableView:status];
        }];
      }
    return _orderModel;
}

- (void)displayTableView:(QueryStatus)status{
    switch (status) {
        case QueryStatus_Success:{
            [self.pullTableView reloadData];
             
            break;
        }
            
           
            
        default:
            break;
    }
}
- (NSArray *)sections{
    if (!_sections) {
        _sections = [NSArray array];
    }
    return _sections;
}

- (NSMutableDictionary *)Dic{
    if (!_Dic) {
        _Dic = [NSMutableDictionary dictionary];
    }
    return _Dic;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)addPullList2{
   [self.pullTf2 addPullListWithDataSource:@[@"4",@"5"] withClickBlock:^(NSInteger index) {
       switch (index) {
           case 0:
               
               break;
           case 1:
               
               break;
           default:
               break;
       }
   }];

}

- (void)addPullList1{
  [self.pullTf1 addPullListWithDataSource:@[@"1",@"2",@"3"] withClickBlock:^(NSInteger index) {
      switch (index) {
          case 0:
//              NSLog(@"+");
              break;
            case 1:
//              NSLog(@"-");
              break;
            case 2:
//              NSLog(@"*");
              break;
          default:
              break;
      }
  }];
}

- (PullListTextField *)pullTf2{
    if (!_pullTf2) {
        _pullTf2 = [[PullListTextField alloc] initWithFrame:CGRectMake(64, 64, self.view.bounds.size.width - 80, 30) andRightImg:nil];
        _pullTf2.layer.borderWidth = 1.0f;
        _pullTf2.layer.borderColor = [UIColor greenColor].CGColor;
    }
    return _pullTf2;
}

- (PullListTextField *)pullTf1{
    if (!_pullTf1) {
        _pullTf1 = [[PullListTextField alloc] initWithFrame:CGRectMake(0, 64, 80, 30) andRightImg:nil]
        ;
        _pullTf1.layer.borderWidth = 1.0f;
        _pullTf1.layer.borderColor = [UIColor redColor].CGColor
        ;
    }
    return _pullTf1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
