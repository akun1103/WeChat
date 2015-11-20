//
//  KNSetting.h
//  WeChat
//
//  Created by emper on 15/11/20.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KNSettingItem : NSObject

@property (nonatomic,strong) NSString *imageName;
@property (nonatomic,strong) NSString *title;

- (instancetype) initWithTitle:(NSString *)title imageName:(NSString *)imageName;
@end

@interface KNSettingGrounp : NSObject
@property (nonatomic,strong)NSString *headerTitle;
@property (nonatomic,strong)NSString *footerTitle;
@property (nonatomic, strong) NSMutableArray *items;

- (instancetype) initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle settingItems:(KNSettingItem *)firstObj, ...;
@end