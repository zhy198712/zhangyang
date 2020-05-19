//
//  MessageCell.m
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import "MessageCell.h"
#import "MessageCellViewModel.h"
#import "MessageModel.h"

@interface MessageCell ()
@property(nonatomic,strong)UILabel *contextLabel;
@property(nonatomic,strong)UILabel *timeLabel;


@end
@implementation MessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.contextLabel];
        [self.contentView addSubview:self.timeLabel];
        
        [self setupView];
    }
    return self;
}
-(void)setupView{
    
    [self.contextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.height.mas_greaterThanOrEqualTo(34);
        
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.contextLabel.mas_right).mas_offset(5);
        make.bottom.right.mas_equalTo(-5);
        make.top.mas_equalTo(5);
    }];
    
    RAC(self.contextLabel,text) = RACObserve(self.viewModel, context);
    RAC(self.timeLabel,text) = RACObserve(self.viewModel, time);
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UILabel *)timeLabel{
    
    if (!_timeLabel) {
        
        _timeLabel = [self createLabel];
        _timeLabel.text = @"时间";
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}
-(UILabel *)contextLabel{
    
    if (!_contextLabel) {
        
        _contextLabel = [self createLabel];
        _contextLabel.text = @"内容";
    }
    return _contextLabel;
}
-(UILabel *)createLabel{
    
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:14];
    label.numberOfLines = 0;
    return label;;
}
-(MessageCellViewModel *)viewModel{
    
    if (!_viewModel) {
        _viewModel = [[MessageCellViewModel alloc]init];
    }
    return _viewModel;
}

@end
