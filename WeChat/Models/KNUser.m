//
//  KNUser.m
//  WeChat
//
//  Created by emper on 15/11/20.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KNUser.h"

@implementation KNUser

- (void)setUserName:(NSString *)userName
{
    _userName = userName;
    _pinyin = userName.pinyin;
}

@end
