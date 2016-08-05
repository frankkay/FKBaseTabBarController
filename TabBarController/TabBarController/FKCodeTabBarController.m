//
//  FKCodeTabBarController.m
//  TabBarController
//
//  Created by 1 on 16/8/5.
//  Copyright © 2016年 hongtuhulian. All rights reserved.
//

#import "FKCodeTabBarController.h"
#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
@interface FKCodeTabBarController ()

@end

@implementation FKCodeTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setController{
    // 初始化vc
    ViewController *vc = [[ViewController alloc] init];
    ViewController1 *vc1 = [[ViewController1 alloc] init];
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    NSMutableArray *vcs = [NSMutableArray arrayWithArray:@[vc,vc1,vc2]];
    // 设置tabbar item内容
    NSMutableArray *items = [NSMutableArray arrayWithArray:@[
                                                             
            @{
                @"img":@"tab_home_nor",
                @"selectedimg":@"tab_home_sel",
                @"title":@"我是老大",
                @"normalColor":@"#818181",
                @"selectedColor":@"#0090e6"
                },
            @{
                @"img":@"tab_pricelist_nor",
                @"selectedimg":@"tab_pricelist_sel",
                @"title":@"叫我小二",
                @"normalColor":@"#818181",
                @"selectedColor":@"#0090e6"
                },
            @{
                @"img":@"tab_myself_nor",
                @"selectedimg":@"tab_myself_sel",
                @"title":@"我是老三",
                @"normalColor":@"#818181",
                @"selectedColor":@"#0090e6"
                }
            
        ]];
    [self setCodeTabbarController:vcs withArray:items];

}
@end
