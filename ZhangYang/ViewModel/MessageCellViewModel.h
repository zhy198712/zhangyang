//
//  MessageCellViewModel.h
//  ZhangYang
//
//  Created by HOU on 2020/5/19.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MessageModel;
NS_ASSUME_NONNULL_BEGIN

@interface MessageCellViewModel : NSObject

@property(nonatomic,strong)NSString *context;
@property(nonatomic,strong)NSString *time;
-(void)setupViewModel:(MessageModel *)message;
@end

NS_ASSUME_NONNULL_END
