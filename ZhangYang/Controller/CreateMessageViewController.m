//
//  CreateMessageViewController.m
//  ZhangYang
//
//  Created by HOU on 2020/5/19.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import "CreateMessageViewController.h"
#import "MessageModel.h"
#import "MessageCreateViewModel.h"

@interface CreateMessageViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@property (weak, nonatomic) IBOutlet UITextField *typeTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;

@property(nonatomic,strong)MessageModel *message;

@end

@implementation CreateMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RAC(self.message, messageId) = self.userNameTextField.rac_textSignal;
    RAC(self.message, messageContent) = self.contentTextField.rac_textSignal;
    RAC(self.message, messageType) = self.typeTextField.rac_textSignal;
    RAC(self.message, messageState) = self.stateTextField.rac_textSignal;

}
- (IBAction)sendMessage:(id)sender {
    
    
    NSLog(@"%@",self.message);
    
    self.viewModel.message = _message;
    
    @weakify(self);
    [[self.viewModel.requestCommand execute:@"111" ]subscribeNext:^(id  _Nullable x) {
     
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
        
    } error:^(NSError * _Nullable error) {
        
    } completed:^{
        
    }];
    
}
-(MessageCreateViewModel *)viewModel{
    
    if (!_viewModel) {
        
        _viewModel = [[MessageCreateViewModel alloc]init];
    }
    return _viewModel;
}
-(MessageModel *)message{
    
    if (!_message) {
        
        _message = [[MessageModel alloc]init];
    }
    return _message;;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
