//
//  ViewController.m
//  NICopyDBToSandBoxDemo
//
//  Created by nixinsheng on 2017/6/23.
//  Copyright © 2017年 nixinsheng. All rights reserved.
//

#import "ViewController.h"
#import "NICopyDBToSandBox.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([NICopyDBToSandBox copyDBToSandBoxWithDBName:@"AS.sqlite"]) {
        NSLog(@"Success.");
        NSLog(@"%@",[NICopyDBToSandBox getAllFileNamesArray]);
    }else{
        NSLog(@"Fail.");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
