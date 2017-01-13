//
//  PlistReadUtil.m
//  iCocosRouter
//
//  Created by iCocosRouter on 17/1/2.
//  Copyright © 2017年 iCocosRouter. All rights reserved.
//

#import "iCocosPlistReadUtil.h"

@implementation iCocosPlistReadUtil


/**
 实例化plist
 */
+(id)sharedInstanceWithFileName:(NSString *)plistfileName
{
    static dispatch_once_t onceToken;
    static iCocosPlistReadUtil * plistUtil;
    dispatch_once(&onceToken,^{
        plistUtil = [[iCocosPlistReadUtil alloc] init];
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistfileName ofType:@"plist"];
        plistUtil.plistdata = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    });
    return plistUtil;
}


/**
 读取plist键值对
 */
+ (NSString *)plistValueForKey:(NSString *)key
{
    iCocosPlistReadUtil *plist =  [iCocosPlistReadUtil sharedInstanceWithFileName:@"iCocosUrlRouter"];
    return [plist.plistdata objectForKey:key];
}


@end
