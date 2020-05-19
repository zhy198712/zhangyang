//
//  MessageCreateViewModel.h
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MessageModel;
NS_ASSUME_NONNULL_BEGIN

@interface MessageCreateViewModel : NSObject
@property(nonatomic,strong)RACCommand * requestCommand;
@property(nonatomic,strong)MessageModel *message;
@end

NS_ASSUME_NONNULL_END
