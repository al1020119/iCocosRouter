//
//  WXRouter.h
//  iCocosRouter
//
//  Created by iCocosRouter on 17/1/2.
//  Copyright © 2017年 iCocosRouter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface iCocosRouterHandler : NSObject


/**
 单例初始化方法
 */
+(id)sharedInstance;


/**
 根据名字获取控制器
 */
-(UIViewController *)getViewController:(NSString *)stringVCName;

/**
 根据名字和参数获取控制器
 */
-(UIViewController *)getViewController:(NSString *)stringVCName withParam:(NSDictionary *)paramdic;


@end
