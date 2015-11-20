//
//  FounctionCell.h
//  WeChat
//
//  Created by emper on 15/11/20.
//  Copyright © 2015年 Kevin. All rights reserved.
//
#import "CommonTableViewCell.h"
#import "KNSetting.h"

@interface FounctionCell :CommonTableViewCell

@property (nonatomic,strong) UIImageView *mainImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic, strong) KNSettingItem *item;

@end
