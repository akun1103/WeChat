//
//  UserDetailCell.m
//  WeChat
//
//  Created by emper on 15/11/20.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "UserDetailCell.h"

@implementation UserDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _avatarImageView = [[UIImageView alloc] init];
        [_avatarImageView.layer setMasksToBounds:YES];
        [_avatarImageView.layer setCornerRadius:5.0f];
        [self addSubview:_avatarImageView];
        _userNameLabel = [[UILabel alloc] init];
        [_userNameLabel setFont:[UIFont systemFontOfSize:17.0f]];
        [self addSubview:_userNameLabel];
        _userIDLabel = [[UILabel alloc] init];
        [_userIDLabel setFont:[UIFont systemFontOfSize:14.0f]];
//        [_userIDLabel setTextColor:DEFAULT_TEXT_GRAY_COLOR];
        [self addSubview:_userIDLabel];
        _nikeNameLabel = [[UILabel alloc] init];
        [_nikeNameLabel setFont:[UIFont systemFontOfSize:13.0f]];
        [_nikeNameLabel setTextColor:DEFAULT_TEXT_GRAY_COLOR];
        [self addSubview:_nikeNameLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    float spaceX = self.leftFreeSpace;
    float spaceY = self.frameHeight *0.15;
    float imageHeight = self.frameHeight - spaceY * 2;
    float x = spaceX;
    float y = spaceY * 1.45;

    [_avatarImageView setFrame:CGRectMake(x, spaceY, imageHeight, imageHeight)];
    
    x = x * 2 + imageHeight;
    float labelWidth = self.frameWidth - x -spaceX;
    float labelHeight = self.frameHeight * 0.2;
    [_userNameLabel setFrame:CGRectMake(x, y, labelWidth, labelHeight)];
    
    y = y + labelHeight + spaceY * 0.9;
    [_userIDLabel setFrame:CGRectMake(x, y, labelWidth, labelHeight)];
}

- (void)setUser:(KNUser *)user
{
    [_avatarImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",user.avatarURL]]];
    _userNameLabel.text = user.userName;
    _userIDLabel.text = [NSString stringWithFormat:@"微信号:%@",user.userID];
}
@end
