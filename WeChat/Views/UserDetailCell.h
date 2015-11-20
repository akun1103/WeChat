//
//  UserDetailCell.h
//  WeChat
//
//  Created by emper on 15/11/20.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "KNUser.h"

@interface UserDetailCell : CommonTableViewCell

@property (nonatomic,strong) KNUser *user;

@property (nonatomic,strong) UILabel *userNameLabel;
@property (nonatomic,strong) UILabel *userIDLabel;
@property (nonatomic,strong) UILabel *nikeNameLabel;
@property (nonatomic,strong) UIImageView *avatarImageView;

@end
