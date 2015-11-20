//
//  FounctionCell.m
//  WeChat
//
//  Created by emper on 15/11/20.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "FounctionCell.h"

@implementation FounctionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:17.0f]];
        [self addSubview:_titleLabel];
        
        _mainImageView = [[UIImageView alloc] init];
        [self addSubview:_mainImageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    float spaceX = self.leftFreeSpace;
    float spaceY = self.frameHeight * 0.2;
    float height = self.frameHeight -spaceY * 2;
    float x = spaceX;
    float labelWidth = [_titleLabel sizeThatFits:CGSizeMake(self.frameWidth*0.45, MAXFLOAT)].width;
    
    [_mainImageView setFrame:CGRectMake(spaceX, spaceY, height, height)];
    x = spaceX * 2 + height;
    
    [_titleLabel setFrame:CGRectMake(x, spaceY, labelWidth, height)];
}

- (void) setItem:(KNSettingItem *)item
{
    _item = item;
    // 主图片
    if (item.imageName != nil && item.imageName.length > 0) {
        [_mainImageView setImage:[UIImage imageNamed:item.imageName]];
        [_mainImageView setHidden:NO];
    }
    else {
        [_mainImageView setHidden:YES];
    }
    // 主标题
    if (item.title != nil && item.title.length > 0) {
        [_titleLabel setText:item.title];
        [_titleLabel setHidden:NO];
    }
    else {
        [_titleLabel setHidden:YES];
    }
}
@end
