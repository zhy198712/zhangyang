//
//  MessageCreateViewModel.m
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import "MessageCreateViewModel.h"
#import "MessageModel.h"
#import "MessageCreateApi.h"

@implementation MessageCreateViewModel
-(RACCommand *)requestCommand{
    
    if (!_requestCommand) {
        
        _requestCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                NSLog(@"%@",input);
                
                MessageCreateApi *api = [[MessageCreateApi alloc]initWithMessage:self.message];
                
                [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                    
                    [subscriber sendNext:request.responseObject];
                    [subscriber sendCompleted];
                    
                } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                    
                    [subscriber sendError:request.error];
                }];
                return [RACDisposable disposableWithBlock:^{
                    
                }];
            }];
        }];
    }
    return _requestCommand;
}
@end
