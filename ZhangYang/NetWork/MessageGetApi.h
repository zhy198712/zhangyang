//
//  MessageGetApi.h
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN
@class MessageGetModel;
@interface MessageGetApi : YTKRequest
-(instancetype)initWithMessage:(MessageGetModel *)message;

@end

NS_ASSUME_NONNULL_END
