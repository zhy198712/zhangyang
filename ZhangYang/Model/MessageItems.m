//
//  MessageItems.m
//  ZhangYang
//
//  Created by HOU on 2020/5/19.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import "MessageItems.h"
#import "MessageModel.h"
@implementation MessageItems
+ (NSDictionary *)modelContainerPropertyGenericClass {

    return @{@"items" : [MessageModel class]};
}
@end
