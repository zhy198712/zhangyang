//
//  MessageCellViewModel.m
//  ZhangYang
//
//  Created by HOU on 2020/5/19.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import "MessageCellViewModel.h"
#import "MessageModel.h"

@implementation MessageCellViewModel


-(void)setupViewModel:(MessageModel *)message{
    
    self.time = [NSString stringWithFormat:@"%ld",message.messageCreationTime];
    self.context = message.messageContent;
}
@end
