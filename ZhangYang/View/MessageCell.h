//
//  MessageCell.h
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageCellViewModel;
NS_ASSUME_NONNULL_BEGIN

@interface MessageCell : UITableViewCell
@property(nonatomic,strong)MessageCellViewModel *viewModel;
@end

NS_ASSUME_NONNULL_END
