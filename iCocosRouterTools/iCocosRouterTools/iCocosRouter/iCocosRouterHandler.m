//
//  WXRouter.m
//  iCocosRouter
//
//  Created by iCocosRouter on 17/1/2.
//  Copyright © 2017年 iCocosRouter. All rights reserved.
//

#import "iCocosRouterHandler.h"
#import "iCocosRouterDefault.h"
#import "iCocosRouterError.h"
#import "iCocosPlistReadUtil.h"

/**
 警告处理
 */
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


@implementation iCocosRouterHandler

/**
 单例初始化方法
 */
+(id)sharedInstance
{
    static dispatch_once_t onceToken;
    static iCocosRouterHandler * router;
    dispatch_once(&onceToken,^{
        router = [[iCocosRouterHandler alloc] init];
    });
    return router;
}


/**
 根据名字和参数获取控制器
 */
-(UIViewController *)controller:(UIViewController *)controller withParam:(NSDictionary *)paramdic andVcname:(NSString *)vcName {
    
    SEL selector = NSSelectorFromString(@"iniViewControllerParam:");
    if(![controller respondsToSelector:selector]){  //如果没定义初始化参数方法，直接返回，没必要在往下做设置参数的方法
        NSLog(@"目标类:%@未定义:%@方法",controller,@"iniViewControllerParam:");
        return controller;
    }
    
    if(paramdic == nil){   //如果参数为空 URLKEY 页面唯一路径标识别
        paramdic = [[NSMutableDictionary alloc] init];
        [paramdic setValue:vcName forKey:@"URLKEY"];
        SuppressPerformSelectorLeakWarning([controller performSelector:selector withObject:paramdic]);
    }else{
        [paramdic setValue:vcName forKey:@"URLKEY"];
    }
    SuppressPerformSelectorLeakWarning( [controller performSelector:selector withObject:paramdic]);
    return controller;
}


/**
 根据名字获取控制器
 */
-(UIViewController *)getViewController:(NSString *)stringVCName
{
    NSString *viewControllerName = [iCocosPlistReadUtil plistValueForKey:stringVCName];
    Class class = NSClassFromString(viewControllerName);
    UIViewController *controller = [[class alloc] init];
    if(controller == nil){  //此处可以跳转到一个错误提示页面
        NSLog(@"未定义此类:%@",viewControllerName);
        return nil;
    }
    return controller;
    
}


/**
 根据名字和参数获取控制器
 */
-(UIViewController *)getViewController:(NSString *)stringVCName withParam:(NSDictionary *)paramdic
{
    
    UIViewController *controller = [self getViewController:stringVCName];
    if(controller != nil){
        controller = [self controller:controller withParam:paramdic andVcname:stringVCName];
    }else{  //异常处理  可以跳转指定的错误页面
        controller = [[iCocosRouterError sharedInstance] getErrorController];
    }
    return controller;
    
}


@end
