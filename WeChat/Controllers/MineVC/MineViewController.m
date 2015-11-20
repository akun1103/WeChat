//
//  MineViewController.m
//  WeChat
//
//  Created by emper on 15/11/19.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "MineViewController.h"
#import "FounctionCell.h"
#import "UserDetailCell.h"
#import "KNSetting.h"
#import "KNUser.h"

@interface MineViewController ()
{
    NSArray *grounpArray;
    KNUser *user;
}
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setHidesBottomBarWhenPushed:NO];
    self.navigationItem.title = @"我";
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 15.0f)];
    [self.tableView setTableHeaderView:view];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[FounctionCell class] forCellReuseIdentifier:@"FunctionCell"];
    [self.tableView registerClass:[UserDetailCell class] forCellReuseIdentifier:@"UserDetailCell"];
    
    grounpArray = [self getMineVCItems];
    [self initMineUser];
    [self.tableView reloadData];
}

- (void)initMineUser
{
    user = [[KNUser alloc] init];
    user.userName = @"Just";
    user.userID = @"akun1103";
    user.avatarURL = [NSURL URLWithString:@"0.jpg"];
}

- (NSMutableArray *) getMineVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    KNSettingItem *album = [[KNSettingItem alloc] initWithTitle:@"相册" imageName:@"MoreMyAlbum"];
    KNSettingItem *favorite = [[KNSettingItem alloc] initWithTitle:@"收藏" imageName:@"MoreMyFavorites"];
    KNSettingItem *bank = [[KNSettingItem alloc] initWithTitle:@"钱包" imageName:@"MoreMyBankCard"];
    KNSettingItem *card = [[KNSettingItem alloc] initWithTitle:@"卡包" imageName:@"MyCardPackageIcon"];
    KNSettingGrounp *group1 = [[KNSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:album, favorite, bank, card, nil];
    [items addObject:group1];
    
    KNSettingItem *expression = [[KNSettingItem alloc] initWithTitle:@"表情" imageName:@"MoreExpressionShops"];
    KNSettingGrounp *group2 = [[KNSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:expression, nil];
    [items addObject:group2];
    
    KNSettingItem *setting = [[KNSettingItem alloc] initWithTitle:@"设置" imageName:@"MoreSetting"];
    KNSettingGrounp *group3 = [[KNSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:setting, nil];
    [items addObject:group3];
    
    return items;
}

#pragma mark - UITableView

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return grounpArray.count + 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return [[grounpArray objectAtIndex:section-1] items].count;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"FotterView"];
    if (view == nil) {
        view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"FotterView"];
        [view setBackgroundView:[UIView new]];
    }
    return view;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UserDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserDetailCell"];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell.topLineStyle = CellLineStyleFill;
        cell.bottomLineStyle = CellLineStyleFill;
        cell.user = user;
        return cell;
    }
    FounctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];

    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    cell.topLineStyle = CellLineStyleFill;
    cell.bottomLineStyle = CellLineStyleFill;
    
    NSInteger count = [[grounpArray objectAtIndex:indexPath.section-1] items].count;
    
    cell.item = [[[grounpArray objectAtIndex:indexPath.section-1] items] objectAtIndex:indexPath.row];
    
    indexPath.row == 0 ?[cell setTopLineStyle:CellLineStyleFill]:[cell setTopLineStyle:CellLineStyleNone];
    indexPath.row == (count-1) ?[cell setBottomLineStyle:CellLineStyleFill]:[cell setBottomLineStyle:CellLineStyleDefault];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 90.0f;
    }
    return 44.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20.0f;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
