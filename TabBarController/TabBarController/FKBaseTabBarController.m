//
//  FKBaseTabBarController.m
//  风电资源平台
//
//  Created by 1 on 16/8/3.
//  Copyright © 2016年 com.hongtu. All rights reserved.
//

#import "FKBaseTabBarController.h"

@interface FKBaseTabBarController ()<UITabBarDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,strong) NSMutableArray *FKviewControllers;
@end

@implementation FKBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -纯sb设置tabbarController

- (void)setTabbarController:(UIStoryboard *)sb withArray:(NSMutableArray *)tabbarArr{
    
    _FKviewControllers = [NSMutableArray array];
    
    for (int i=0; i<tabbarArr.count; i++) {
        UIViewController *nav = [sb instantiateViewControllerWithIdentifier:tabbarArr[i][@"sbid"]];
        [self setImage:tabbarArr[i][@"img"] SelectImage:tabbarArr[i][@"selectedimg"] BarItem:nav title:tabbarArr[i][@"title"] normalTextColor:tabbarArr[i][@"normalColor"] SelectedTextColor:tabbarArr[i][@"selectedColor"]];
        
        [self.FKviewControllers addObject:nav];
        
    }
    
    self.viewControllers = self.FKviewControllers;
    
}


#pragma mark - 纯代码设置tabbarcontroller
- (void)setCodeTabbarController:(NSMutableArray *)VCArr withArray:(NSMutableArray *)tabbarArr{
    
    _FKviewControllers = [NSMutableArray array];
    
    for (int i=0; i<tabbarArr.count; i++) {
        
        [self setImage:tabbarArr[i][@"img"] SelectImage:tabbarArr[i][@"selectedimg"] BarItem:VCArr[i] title:tabbarArr[i][@"title"] normalTextColor:tabbarArr[i][@"normalColor"] SelectedTextColor:tabbarArr[i][@"selectedColor"]];
        
    }
    
    _FKviewControllers = VCArr;
    
    self.viewControllers = self.FKviewControllers;
    
}


#pragma mark - 设置item的图片 字体

- (void)setImage:(NSString *)imagestr SelectImage:(NSString *)selectImagestr BarItem:(UIViewController *)nav  title:(NSString *)title normalTextColor:(NSString *)normalColor SelectedTextColor:(NSString *)selectedColor{
    
    nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imagestr] selectedImage:[UIImage imageNamed:selectImagestr]];
    
    nav.tabBarItem.image = [nav.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    nav.tabBarItem.selectedImage = [nav.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [nav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[self getColor:selectedColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:11],NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    [nav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[self getColor:normalColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:11],NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    nav.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4);
    
    nav.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    
}

//@"#0090e6" @"#818181"

#pragma mark - 通过十六进制转换成颜色
- (UIColor *)getColor:(NSString *)color

{
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) {
        
        return [UIColor clearColor];
        
    }
    
    // strip 0X if it appears
    
    if ([cString hasPrefix:@"0X"])
        
        cString = [cString substringFromIndex:2];
    
    if ([cString hasPrefix:@"#"])
        
        cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6)
        
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    
    range.location = 0;
    
    range.length = 2;
    
    //r
    
    NSString *rString = [cString substringWithRange:range];
    
    
    
    //g
    
    range.location = 2;
    
    NSString *gString = [cString substringWithRange:range];
    
    
    
    //b
    
    range.location = 4;
    
    NSString *bString = [cString substringWithRange:range];
    
    
    
    // Scan values
    
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
    
}

@end
