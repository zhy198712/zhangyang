//
//  MessageCreateApi.h
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
@class MessageModel;
NS_ASSUME_NONNULL_BEGIN

@interface MessageCreateApi : YTKRequest
-(instancetype)initWithMessage:(MessageModel *)message;
@end

NS_ASSUME_NONNULL_END
