//
//  CommonNavigationController.m
//  WeChat
//
//  Created by emper on 15/11/19.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "CommonNavigationController.h"

@interface CommonNavigationController ()

@end

@implementation CommonNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBarTintColor:DEFAULT_NAVBAR_COLOR];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    //also you may add any fancy condition-based code here
    return UIStatusBarStyleLightContent;
}

@end
