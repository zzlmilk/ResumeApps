//
//  HomeTableViewCell.m
//  ResumeManage
//
//  Created by 单好坤 on 14-9-16.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "HomeCell.h"
#import "UIImageView+AFNetworking.h"

@implementation HomeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

    }
    return self;
}


-(void)setHome:(Home *)home{
    
   // _textContentLabel.backgroundColor = [UIColor yellowColor];
    
    _userNameLabel.text = home.user.screenName;
    _sendTimeLabel.text = home.created_at;
    [_userImageView setImageWithURL:[NSURL URLWithString:home.user.imageUrl]];
    _textContentLabel.text = home.text;
    
}

//赋值 and 自动换行,计算出cell的高度
-(void)setIntroductionText:(NSString*)text{
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    self.textContentLabel.text = text;
    //设置label的最大行数
    self.textContentLabel.numberOfLines = 10;
    CGSize size = CGSizeMake(300, 1000);
//    CGSize labelSize = [self.textContentLabel.text sizeWithFont:self.textContentLabel.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
    
    NSDictionary *attribute = @{NSFontAttributeName: self.textContentLabel.font};
    CGSize labelSize = [self.textContentLabel.text boundingRectWithSize: size options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    
    self.textContentLabel.frame = CGRectMake(self.textContentLabel.frame.origin.x, self.textContentLabel.frame.origin.y, labelSize.width, labelSize.height);
    //计算出自适应的高度
    frame.size.height = labelSize.height+90;
    self.frame = frame;
    
    //调整行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.textContentLabel.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:6];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.textContentLabel.text length])];
    self.textContentLabel.attributedText = attributedString;
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
