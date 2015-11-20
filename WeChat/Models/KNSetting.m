//
//  KNSetting.m
//  WeChat
//
//  Created by emper on 15/11/20.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KNSetting.h"

@implementation KNSettingItem

- (instancetype) initWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    if (self = [super init]) {
        _title = title;
        _imageName = imageName;
    }
    return self;
}
@end

@implementation KNSettingGrounp

- (instancetype) initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle settingItems:(KNSettingItem *)firstObj, ...
{
    if (self = [super init]) {
        _headerTitle = headerTitle;
        _footerTitle = footerTitle;
        _items = [[NSMutableArray alloc] init];
        va_list argList;
        if (firstObj) {
            [_items addObject:firstObj];
            va_start(argList, firstObj);
            id arg;
            while ((arg = va_arg(argList, id))) {
                [_items addObject:arg];
            }
            va_end(argList);
        }
    }
    return self;
}

@end