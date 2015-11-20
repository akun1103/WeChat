//
//  DiscoverViewController.m
//  WeChat
//
//  Created by emper on 15/11/19.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "DiscoverViewController.h"
#import "FounctionCell.h"
@interface DiscoverViewController ()
{
    NSArray *grounpArray;
}
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setHidesBottomBarWhenPushed:NO];
    self.navigationItem.title = @"发现";
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 15.0f)];
    [self.tableView setTableHeaderView:view];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[FounctionCell class] forCellReuseIdentifier:@"FunctionCell"];
    
    grounpArray = [self getDiscoverVCItems];
}

- (NSMutableArray *) getDiscoverVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    KNSettingItem *friendsAlbum = [[KNSettingItem alloc] initWithTitle:@"朋友圈" imageName:@"ff_IconShowAlbum"];
    KNSettingGrounp *group1 = [[KNSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:friendsAlbum, nil];
    [items addObject:group1];
    
    KNSettingItem *qrCode = [[KNSettingItem alloc] initWithTitle:@"扫一扫" imageName:@"ff_IconQRCode"];
    KNSettingItem *shake = [[KNSettingItem alloc] initWithTitle:@"摇一摇" imageName:@"ff_IconShake"];
    KNSettingGrounp *group2 = [[KNSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:qrCode, shake, nil];
    [items addObject:group2];
    
    KNSettingItem *loacation = [[KNSettingItem alloc] initWithTitle:@"附近的人" imageName:@"ff_IconLocationService"];
    KNSettingItem *bottle = [[KNSettingItem alloc] initWithTitle:@"漂流瓶" imageName:@"ff_IconBottle"];
    KNSettingGrounp *group3 = [[KNSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:loacation, bottle, nil];
    [items addObject:group3];
    
    KNSettingItem *shopping = [[KNSettingItem alloc] initWithTitle:@"购物" imageName:@"CreditCard_ShoppingBag"];
    KNSettingItem *game = [[KNSettingItem alloc] initWithTitle:@"游戏" imageName:@"MoreGame"];
    KNSettingGrounp *group4 = [[KNSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:shopping, game, nil];
    [items addObject:group4];
    
    return items;
}
#pragma mark - UITableView

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return grounpArray.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[grounpArray objectAtIndex:section] items].count;
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
    
    FounctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    cell.topLineStyle = CellLineStyleFill;
    cell.bottomLineStyle = CellLineStyleFill;
    
    NSInteger count = [[grounpArray objectAtIndex:indexPath.section] items].count;
    
    cell.item = [[[grounpArray objectAtIndex:indexPath.section] items] objectAtIndex:indexPath.row];
    
    indexPath.row == 0 ?[cell setTopLineStyle:CellLineStyleFill]:[cell setTopLineStyle:CellLineStyleNone];
    indexPath.row == (count-1) ?[cell setBottomLineStyle:CellLineStyleFill]:[cell setBottomLineStyle:CellLineStyleDefault];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
