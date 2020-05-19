//
//  MessageCreateApi.m
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import "MessageCreateApi.h"
#import "MessageModel.h"

@implementation MessageCreateApi
{
    MessageModel *requestMessage;
}
-(instancetype)initWithMessage:(MessageModel *)message{
    
    if (self = [super init]) {
        
        requestMessage = message;
    }
    return self;
}
-(NSString *)requestUrl{
    
    return HOST;
}
-(YTKRequestSerializerType)requestSerializerType{
    return YTKRequestSerializerTypeJSON;
}
-(YTKRequestMethod)requestMethod{
    
    return YTKRequestMethodPOST;
}
-(id)requestArgument{
    
    return [requestMessage yy_modelToJSONObject];
}
@end
