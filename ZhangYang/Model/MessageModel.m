//
//  MessageCreateModel.m
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"messageId" : @"id",
             @"messageContent" : @"content",
             @"messageType" : @"type",
             @"messageState" : @"state",
             @"messageCreationTime" : @"creationTime"
    };
}
@end
