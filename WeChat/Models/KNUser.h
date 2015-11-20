//
//  KNUser.h
//  WeChat
//
//  Created by emper on 15/11/20.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KNUser : NSObject

@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *userID;
@property (nonatomic,strong) NSString *nikeName;
@property (nonatomic,strong) NSURL *avatarURL;
@property (nonatomic,strong) NSString *pinyin;

@end
