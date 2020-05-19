//
//  MessageListController.m
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import "MessageListController.h"
#import "MessageGetApi.h"
#import "MessageGetModel.h"
#import "MessageListViewModel.h"
#import "MessageCell.h"
#import "MessageItems.h"
#import "MessageCellViewModel.h"
#import "MessageModel.h"


@interface MessageListController ()
@property(nonatomic,strong)MessageListViewModel *viewModel;
@property(nonatomic,strong)NSMutableArray *itemsArray;
@property(nonatomic,assign)NSInteger lasttimep;//最后一次刷新
@end

@implementation MessageListController
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.tableView.mj_header beginRefreshing];
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title  = @"消息列表";
    
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[MessageCell class] forCellReuseIdentifier:@"messageCell"];
    
    //下拉刷新
    @weakify(self);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
     
        @strongify(self);
        [self.tableView.mj_footer resetNoMoreData];
        self.lasttimep = 0;
        self.viewModel.requestModel.messageLastItem = 0;
        [self.itemsArray removeAllObjects];
        [self fetchItemList];
        
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        [self fetchItemList];

    }];
    [self.tableView.mj_header beginRefreshing];
}
-(void)fetchItemList{
    
    self.viewModel.requestModel.messageId= @"zhangyangdugu";
    self.viewModel.requestModel.messageLimit= 3;

    @weakify(self);
    [[self.viewModel.requestCommand execute:@(self.lasttimep)]subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        
        [self endrefresh];

        MessageItems *items = (MessageItems *)x;

        if (items!=nil&&[items.items count]!=0) {
            
            [self.itemsArray addObjectsFromArray:items.items];
            MessageModel *model = self.itemsArray.lastObject;
            self.lasttimep = model.messageCreationTime;
            
            [self.tableView reloadData];
            
        } else {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
    } error:^(NSError * _Nullable error) {
        
    } completed:^{
        
    }];
    
}

-(void)endrefresh{
    
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.itemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell"];
    MessageModel *model = self.itemsArray[indexPath.row];
    [cell.viewModel setupViewModel:model];
    
    return cell;
}
-(MessageListViewModel *)viewModel{
    
    if (!_viewModel) {
        
        _viewModel = [[MessageListViewModel alloc]init];
    }
    return _viewModel;
}
-(NSMutableArray *)itemsArray{
    
    if (!_itemsArray) {
        
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}


@end
