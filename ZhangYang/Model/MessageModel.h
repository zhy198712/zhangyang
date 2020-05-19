//
//  MessageCreateModel.h
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageModel : NSObject

@property(nonatomic,strong)NSString *messageId;
@property(nonatomic,strong)NSString *messageContent;
@property(nonatomic,assign)NSInteger messageType;
@property(nonatomic,assign)NSInteger messageState;
@property(nonatomic,assign)NSInteger messageCreationTime;

@end

NS_ASSUME_NONNULL_END
