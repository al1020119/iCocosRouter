//
//  ViewController.m
//  iCocosRouterTools
//
//  Created by tqy on 17/1/13.
//  Copyright © 2017年 iCocos. All rights reserved.
//

#import "ViewController.h"
#import "iCocosRouterHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"iCocosRouter";
}


/**
 访问自定义的控制，随便控制
 */
- (IBAction)iCocosViewController:(id)sender {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"iCocosLoverViewController" forKey:@"title"];
    UIViewController *controller = [[iCocosRouterHandler sharedInstance] getViewController:@"iCocosRouterViewController"  withParam:dic];
    [self.navigationController pushViewController:controller animated:YES];
}



/**
 访问的Router不存在的时候，一般直接使用自己或者公司的网站
 */
- (IBAction)ErrorViewController:(id)sender {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"ErrorPage" forKey:@"title"];
    UIViewController *controller = [[iCocosRouterHandler sharedInstance] getViewController:@"iCocosLover" withParam:dic];
    [self.navigationController pushViewController:controller animated:YES];
}



/**
 访问网页的时候
 */
- (IBAction)iCocosWebViewController:(id)sender {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"WebView" forKey:@"title"];
    [dic setValue:@"https://www.baidu.com" forKey:@"url"];
    UIViewController *controller = [[iCocosRouterHandler sharedInstance] getViewController:@"iCocosDefault" withParam:dic];
    [self presentViewController:controller animated:YES completion:nil];
    
}


@end
