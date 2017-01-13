//
//  webView.m
//  iCocosRouter
//
//  Created by iCocosRouter on 17/1/2.
//  Copyright © 2017年 iCocosRouter. All rights reserved.
//

#import "iCocosRouterDefault.h"

@implementation iCocosRouterDefault


/**
 初始化
 */
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    /**
     * 这里为了方便使用iOS8之前的UIWebView，实际开发请使用WKWebView
     */
    UIWebView * view = [[UIWebView alloc]initWithFrame:self.view.frame];
    [view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:view];
}


/**
 配置方法
 */
-(void)iniViewControllerParam:(NSDictionary *)dic{
    self.url = dic[@"url"];
    self.title = dic[@"title"];
    NSLog(@"%@", dic);
}


/**
 关闭
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
