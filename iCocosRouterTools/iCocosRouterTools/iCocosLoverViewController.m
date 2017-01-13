//
//  iCocosLoverViewController.m
//  iCocosRouter
//
//  Created by tqy on 17/1/13.
//  Copyright © 2017年 iCocosRouter. All rights reserved.
//

#import "iCocosLoverViewController.h"

@interface iCocosLoverViewController ()

@end

@implementation iCocosLoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)iniViewControllerParam:(NSDictionary *)dic
{
    self.title = [dic objectForKey:@"title"];
    NSLog(@"%@", dic);
}

@end
