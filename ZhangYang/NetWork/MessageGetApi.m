//
//  MessageGetApi.m
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import "MessageGetApi.h"
#import "MessageGetModel.h"
@implementation MessageGetApi
{
    MessageGetModel *paramModel;
}
-(instancetype)initWithMessage:(MessageGetModel *)message{
    
    if (self = [super init]) {
        
        paramModel = message;
    }
    return self;
}
-(NSString *)requestUrl{
    
    
    NSString *bastUrlStr = [NSString stringWithFormat:@"?id=%@&limit=%ld&direction=%ld",paramModel.messageId,paramModel.messageLimit,paramModel.messageDirection];
    
    if (paramModel.messageLastItem!=0) {
        
      bastUrlStr = [bastUrlStr stringByAppendingFormat:@"&lastItem=%ld",paramModel.messageLastItem];
    }

    return bastUrlStr;

}
-(YTKRequestSerializerType)requestSerializerType{
    return YTKRequestSerializerTypeHTTP;
}
-(YTKResponseSerializerType)responseSerializerType{
    
    return YTKResponseSerializerTypeJSON;;
}
-(YTKRequestMethod)requestMethod{
    
    return YTKRequestMethodGET;
}
//-(id)requestArgument{
//
//    return [paramModel yy_modelToJSONObject];
//}
@end
