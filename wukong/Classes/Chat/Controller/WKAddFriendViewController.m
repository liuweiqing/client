//
//  WKAddFriendViewController.m
//  wukong
//
//  Created by liuweiqing on 16/4/12.
//  Copyright © 2016年 RT. All rights reserved.
//

#import "WKAddFriendViewController.h"

@interface WKAddFriendViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *formTableView;

@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIView *footerView;

@end

@implementation WKAddFriendViewController

#pragma mark --life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.formTableView];
}

#pragma mark --UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 60, 60)];
    avatarImageView.image = [UIImage imageNamed:@"fts_default_headimage"];
    [cell addSubview:avatarImageView];
    UILabel *nikeNameLable = [[UILabel alloc] initWithFrame:CGRectMake(85, 15, UI_SCREEN_WIDTH-85-20, 20)];
    nikeNameLable.textColor = [UIColor blackColor];
    nikeNameLable.font = [UIFont systemFontOfSize:15];
    nikeNameLable.text = @"王海明";
    [cell addSubview:nikeNameLable];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

#pragma mark --event response
- (void)addButtonClick
{
    
}


#pragma mark --getter&setter
- (UITableView *)formTableView
{
    if (_formTableView == nil) {
        _formTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _formTableView.delegate = self;
        _formTableView.dataSource = self;
        _formTableView.tableFooterView = self.footerView;
    }
    return _formTableView;
}

- (UIButton *)addButton
{
    if (_addButton == nil) {
        _addButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, UI_BUTTON_WIDTH, UI_BUTTON_HEIGHT)];
        UIImage *image = [UIImage imageNamed:@"GreenBigBtn"];
        NSInteger leftCapWidth = image.size.width * 0.5f;
        NSInteger topCapHeight = image.size.height * 0.5f;
        
        image = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
        [_addButton setBackgroundImage:image forState:UIControlStateNormal];
        [_addButton setTitle:@"添加到通讯录" forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}

- (UIView *)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, 60)];
        [_footerView addSubview:self.addButton];
    }
    return _footerView;
}

@end