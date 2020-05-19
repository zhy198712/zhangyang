//
//  MessageListViewModel.m
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import "MessageListViewModel.h"
#import "MessageGetModel.h"
#import "MessageGetApi.h"
#import "MessageModel.h"
#import "MessageItems.h"

@implementation MessageListViewModel
-(RACCommand *)requestCommand{
    
    if (!_requestCommand) {
        
        _requestCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {

                if ([input integerValue]!=0&&([input integerValue]==self.requestModel.messageLastItem)) {
                    
                    [subscriber sendNext:nil];
                    [subscriber sendCompleted];
                    
                } else {
                    
                    if ([input integerValue]!=0) {                                            self.requestModel.messageLastItem = [input integerValue];
                    }
                    MessageGetApi *api = [[MessageGetApi alloc]initWithMessage:self.requestModel];
                    
                    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                        
                        MessageItems *items = [MessageItems yy_modelWithJSON:request.responseObject[@"data"]];
                        
                        self.requestModel.messageLastItem = [input integerValue];
                        [subscriber sendNext:items];
                        [subscriber sendCompleted];
                        
                    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                        
                        [subscriber sendError:request.error];
                    }];
                }

                return [RACDisposable disposableWithBlock:^{
                    
                }];
            }];
        }];
    }
    return _requestCommand;
}
-(MessageGetModel *)requestModel{
    
    if (!_requestModel) {
        _requestModel = [[MessageGetModel alloc]init];
    }
    return _requestModel;;
}
@end
