//
//  MessageGetModel.m
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import "MessageGetModel.h"


@implementation MessageGetModel
+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"messageId" : @"id",
             @"messageLimit" : @"limit",
             @"messageLastItem" : @"lastItem",
             @"messageDirection" : @"direction"};
}
@end
