//
//  PlistReadUtil.h
//  iCocosRouter
//
//  Created by iCocosRouter on 17/1/2.
//  Copyright © 2017年 iCocosRouter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iCocosPlistReadUtil : NSObject


/**
 plist名字
 */
@property(nonatomic,strong) NSMutableDictionary *plistdata;

/**
 实例化plist
 */


+(id)sharedInstanceWithFileName:(NSString *)plistfileName;

/**
 读取plist键值对
 */
+(NSString *)plistValueForKey:(NSString *)key;


@end
