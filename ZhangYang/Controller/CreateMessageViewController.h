//
//  CreateMessageViewController.h
//  ZhangYang
//
//  Created by HOU on 2020/5/19.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageCreateViewModel;
NS_ASSUME_NONNULL_BEGIN

@interface CreateMessageViewController : UIViewController

@property(nonatomic,strong)MessageCreateViewModel *viewModel;
@end

NS_ASSUME_NONNULL_END
