//
//  FKStoryBoardTabBarController.m
//  TabBarController
//
//  Created by 1 on 16/8/5.
//  Copyright © 2016年 hongtuhulian. All rights reserved.
//

#import "FKStoryBoardTabBarController.h"

@interface FKStoryBoardTabBarController ()

@end

@implementation FKStoryBoardTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *items = [NSMutableArray arrayWithArray:
                @[
                  @{@"sbid":@"VC",     // sb控制的storyboardID
                    @"img":@"tab_home_nor", // item的图标
                    @"selectedimg":@"tab_home_sel", // item的选中图标
                    @"title":@"我是老大", // item的字
                    @"normalColor":@"#818181",// item的正常下字体颜色
                    @"selectedColor":@"#0090e6" // item 选中字体颜色
                    }
                  ,@{@"sbid":@"VC1",
                     @"img":@"tab_pricelist_nor",
                     @"selectedimg":@"tab_pricelist_sel",
                     @"title":@"叫我小二",
                     @"normalColor":@"#818181",
                     @"selectedColor":@"#0090e6"
                     },
                    @{@"sbid":@"VC2",
                      @"img":@"tab_myself_nor",
                      @"selectedimg":@"tab_myself_sel",
                      @"title":@"俺是老三",
                      @"normalColor":@"#818181",
                      @"selectedColor":@"#0090e6"
                     }
                  ]];
    [self setTabbarController:self.storyboard withArray:items];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
