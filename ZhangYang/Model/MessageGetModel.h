//
//  MessageGetModel.h
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageGetModel : NSObject
@property(nonatomic,strong)NSString *messageId;
@property(nonatomic,assign)NSInteger messageLimit;
@property(nonatomic,assign)NSInteger messageLastItem;
@property(nonatomic,assign)NSInteger messageDirection;

@end

NS_ASSUME_NONNULL_END
