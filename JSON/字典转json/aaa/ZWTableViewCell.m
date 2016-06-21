//
//  ZWTableViewCell.m
//  aaa
//
//  Created by stu074 on 16/3/22.
//  Copyright © 2016年 stu074. All rights reserved.
//

#import "ZWTableViewCell.h"

@implementation ZWTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(0,10,80,50)];
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 150, 50)];
        self.remark = [[UILabel alloc ] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
        self.remark.numberOfLines = 0;
        self.remark.lineBreakMode = UILineBreakModeWordWrap;
        
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.title];
        
        [self.contentView addSubview:self.remark];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5)];
        view.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:view];
        
    }
    return self;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
