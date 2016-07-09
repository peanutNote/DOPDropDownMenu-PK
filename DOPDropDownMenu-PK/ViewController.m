//
//  ViewController.m
//  DOPDropDownMenu-PK
//
//  Created by qianye on 16/7/9.
//  Copyright © 2016年 qianye. All rights reserved.
//

#import "ViewController.h"
#import "DOPDropDownMenu.h"

@interface ViewController ()<DOPDropDownMenuDataSource,DOPDropDownMenuDelegate>
@property (nonatomic, strong) NSArray *provinces;
@property (nonatomic, strong) NSArray *city1;
@property (nonatomic, strong) NSArray *city2;
@property (nonatomic, strong) NSArray *address1_1;
@property (nonatomic, strong) NSArray *address1_2;
@property (nonatomic, strong) NSArray *address1_3;
@property (nonatomic, strong) NSArray *classifys;
@property (nonatomic, strong) NSArray *cates;
@property (nonatomic, strong) NSArray *movices;
@property (nonatomic, strong) NSArray *hostels;

@property (nonatomic, strong) NSArray *sorts;
@property (nonatomic, weak) DOPDropDownMenu *menu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"DOPDropDownMenu";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"重新加载" style:UIBarButtonItemStylePlain target:self action:@selector(menuReloadData)];
    // 数据
    self.provinces = @[@"湖北省", @"北京",@"上海"];
    self.city1 = @[@"武汉市", @"宜昌市", @"孝感市"];
    self.city2 = @[@"北京市"];
    self.address1_1 = @[@"江岸区", @"江汉区", @"武昌区"];
    self.address1_2 = @[@"西陵区", @"宜都区"];
    self.address1_3 = @[@"孝南区"];
    self.classifys = @[@"美食",@"今日新单",@"电影",@"酒店"];
    self.cates = @[@"自助餐",@"快餐",@"火锅",@"日韩料理",@"西餐",@"烧烤小吃"];
    self.movices = @[@"内地剧",@"港台剧",@"英美剧"];
    self.hostels = @[@"经济酒店",@"商务酒店",@"连锁酒店",@"度假酒店",@"公寓酒店"];
    self.sorts = @[@"默认排序",@"离我最近",@"好评优先",@"人气优先",@"最新发布"];
    
    // 添加下拉菜单
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:44];
    menu.delegate = self;
    menu.dataSource = self;
    
    [self.view addSubview:menu];
    _menu = menu;
    
    // 创建menu 第一次显示 不会调用点击代理，可以用这个手动调用
    [menu selectDefalutIndexPath];
}

- (void)menuReloadData
{
    self.classifys = @[@"美食",@"今日新单",@"电影"];
    [_menu reloadData];
}
- (IBAction)selectIndexPathAction:(id)sender {
    [_menu selectIndexPath:[DOPIndexPath indexPathWithCol:0 row:0 item:0 unit:2]];
}

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 3;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.provinces.count;
    }else if (column == 1){
        return self.classifys.count;
    }else {
        return self.sorts.count;
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        return self.provinces[indexPath.row];
    } else if (indexPath.column == 1){
        return self.classifys[indexPath.row];
    } else {
        return self.sorts[indexPath.row];
    }
}

// new datasource

- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 1) {
        return [NSString stringWithFormat:@"ic_filter_category_%ld",indexPath.row];
    }
    return nil;
}

- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 1 && indexPath.row >= 0) {
        return [NSString stringWithFormat:@"ic_filter_category_%ld",indexPath.item];
    }
    return nil;
}

// new datasource

- (NSString *)menu:(DOPDropDownMenu *)menu detailTextForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 1) {
        return [@(arc4random()%1000) stringValue];
    }
    return nil;
}

- (NSString *)menu:(DOPDropDownMenu *)menu detailTextForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column != 0) {
        return [@(arc4random()%1000) stringValue];
    }
    return nil;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column
{
    if (column == 0) {
        if (row == 0) {
            return self.city1.count;
        } else if (row == 1) {
            return self.city2.count;
        } else {
            return 0;
        }
    } else if (column == 1) {
        if (row == 0) {
            return self.cates.count;
        } else if (row == 2){
            return self.movices.count;
        } else if (row == 3){
            return self.hostels.count;
        }
    }
    return 0;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        if (indexPath.row == 0) {
            return self.city1[indexPath.item];
        } else if (indexPath.row == 1) {
            return self.city2[indexPath.item];
        } else {
            return 0;
        }
    } else if (indexPath.column == 1) {
        if (indexPath.row == 0) {
            return self.cates[indexPath.item];
        } else if (indexPath.row == 2){
            return self.movices[indexPath.item];
        } else if (indexPath.row == 3){
            return self.hostels[indexPath.item];
        }
    }
    return nil;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfUnitsInItem:(NSInteger)item row:(NSInteger)row column:(NSInteger)column {
    if (column == 0) {
        if (row == 0) {
            if (item == 0) {
                return self.address1_1.count;
            } else if (item == 1) {
                return self.address1_2.count;
            } else {
                return self.address1_3.count;
            }
        } else {
            return 0;
        }
    }
    return 0;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForUnitsInItemAtIndexPath:(DOPIndexPath *)indexPath {
    if (indexPath.column == 0) {
        if (indexPath.row == 0) {
            if (indexPath.item == 0) {
                return self.address1_1[indexPath.unit];
            } else if (indexPath.item == 1) {
                return self.address1_2[indexPath.unit];
            } else {
                return self.address1_3[indexPath.unit];
            }
        } else {
            return nil;
        }
    }
    return nil;
}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.unit >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item, indexPath.unit);
    } else {
        if (indexPath.item >= 0) {
            NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
        }else {
            NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
