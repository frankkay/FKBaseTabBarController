//
//  FKBaseTabBarController.h
//  风电资源平台
//
//  Created by 1 on 16/8/3.
//  Copyright © 2016年 com.hongtu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKBaseTabBarController : UITabBarController

/**storyboard写的VC*/
- (void)setTabbarController:(UIStoryboard *)sb withArray:(NSMutableArray *)tabbarArr;


/**纯代码写的VC*/
-(void)setCodeTabbarController:(NSMutableArray *)VCArr withArray:(NSMutableArray *)tabbarArr;
@end
