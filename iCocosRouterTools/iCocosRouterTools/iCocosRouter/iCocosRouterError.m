//
//  RouterError.m
//  iCocosRouter
//
//  Created by iCocosRouter on 17/1/7.
//  Copyright © 2017年 iCocosRouter. All rights reserved.
//

#import "iCocosRouterError.h"
#import "iCocosRouterHandler.h"
@implementation iCocosRouterError

/**
 单例初始化方法
 */
+(id)sharedInstance
{
    static dispatch_once_t onceToken;
    static iCocosRouterError * routerError;
    dispatch_once(&onceToken,^{
        routerError = [[iCocosRouterError alloc] init];
    });
    return routerError;
}


/**
 出错的时候，默认显示的界面，公司或个人网页
 */
#pragma mark  自定义错误页面 此页面一定确保能够找到，否则会进入死循环
-(UIViewController *)getErrorController{
    NSDictionary *diction = [[NSMutableDictionary alloc] init];
    [diction setValue:@"http://www.iiwanxiu.com" forKey:@"url"];
    UIViewController *errorController = [[iCocosRouterHandler sharedInstance] getViewController:@"iCocosDefault" withParam:diction];
    return errorController;
}



@end
