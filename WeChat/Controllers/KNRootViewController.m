//
//  KNRootViewController.m
//  WeChat
//
//  Created by emper on 15/11/19.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KNRootViewController.h"
#import "ConversationViewController.h"
#import "FriendListViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"
#import "CommonNavigationController.h"

@interface KNRootViewController ()

@end

@implementation KNRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tabBar setBackgroundColor:DEFAULT_SEARCHBAR_COLOR];
    [self.tabBar setTintColor:DEFAULT_GREEN_COLOR];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    [self initChildViewControllers];
}

- (void)initChildViewControllers
{
    NSMutableArray *childViewControllers = [[NSMutableArray alloc] initWithCapacity:4];
    
    ConversationViewController *conversationVC = [[ConversationViewController alloc] init];
    [conversationVC.tabBarItem setTitle:@"微信"];
    [conversationVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
    [conversationVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    CommonNavigationController *convNavC = [[CommonNavigationController alloc] initWithRootViewController:conversationVC];
    
    [childViewControllers addObject:convNavC];
    
    FriendListViewController *friendListVC = [[FriendListViewController alloc] init];
    [friendListVC.tabBarItem setTitle:@"通讯录"];
    [friendListVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_contacts"]];
    [friendListVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    CommonNavigationController *friendListNavC = [[CommonNavigationController alloc] initWithRootViewController:friendListVC];
    
    [childViewControllers addObject:friendListNavC];
    
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc] init];
    [discoverVC.tabBarItem setTitle:@"发现"];
    [discoverVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_discover"]];
    [discoverVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    CommonNavigationController *discNavC = [[CommonNavigationController alloc] initWithRootViewController:discoverVC];
    
    [childViewControllers addObject:discNavC];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    [mineVC.tabBarItem setTitle:@"我"];
    [mineVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_me"]];
    [mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    CommonNavigationController *mineNavC = [[CommonNavigationController alloc] initWithRootViewController:mineVC];
    
    [childViewControllers addObject:mineNavC];
  
    [self setViewControllers:childViewControllers];
}

@end
