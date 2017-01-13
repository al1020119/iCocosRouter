//
//  RouterError.h
//  iCocosRouter
//
//  Created by iCocosRouter on 17/1/7.
//  Copyright © 2017年 iCocosRouter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface iCocosRouterError : NSObject


/**
 单例初始化方法
 */
+(id)sharedInstance;

/**
 出错的时候，默认显示的界面，公司或个人网页
 */
-(UIViewController *)getErrorController;

@end
