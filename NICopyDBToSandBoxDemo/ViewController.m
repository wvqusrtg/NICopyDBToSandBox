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
    /**
     if ([NICopyDBToSandBox copyDBToDocumentsWithDBName:@"AS.sqlite"]) {
         NSLog(@"Success.");
         NSLog(@"%@",[NICopyDBToSandBox getAllFileNamesArrayFromDocuments]);
     }else{
         NSLog(@"Fail.");
     }
     
     if ([NICopyDBToSandBox fileIsExistsFromDocumentsWithFileName:@"UserInfo.plist"]) {
         NSLog(@"YES");
     }else{
         NSLog(@"NO");
     }
     
     if ([NICopyDBToSandBox fileIsExistsFromProductWithFileName:@"Info.plist"]) {
         NSLog(@"YES");
     }else{
         NSLog(@"NO");
     }
     */
    
    /**
     NSLog(@"%@",[NICopyDBToSandBox getDocumentsPath]);
     
     NSLog(@"%@",[NICopyDBToSandBox getFilePathFromDocuments:@"AS.sqlite"]);
     
     NSLog(@"%@",[NICopyDBToSandBox getFilePath:@"AS.sqlite"]);
     
     if ([NICopyDBToSandBox saveNSDictionaryForDocuments:@{@"name":@"nixinsheng",@"sex":@"male",@"age":@"27"} WithFileName:@"UserInfo.plist"]) {
         NSLog(@"Success.");
     }else{
         NSLog(@"Fail.");
     }

     if ([NICopyDBToSandBox saveNSDictionaryForProduct:@{@"name":@"nixinsheng",@"sex":@"male",@"age":@"27"} WithFileName:@"User.plist"]) {
         NSLog(@"Success.");
     }else{
         NSLog(@"Fail.");
     }
     */
    
    //简单测试
    NSLog(@"%@",[self getNowTime_NI]);
    NSLog(@"%@",[self getNowTime_NI_oneHour]);
}

-(NSString *)getNowTime_NI{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *DateTime = [formatter stringFromDate:date];
    //NSLog(@"%@============年-月-日  时：分：秒=====================",DateTime);
    return DateTime;
}

-(NSString *)getNowTime_NI_oneHour{
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:3600];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *DateTime = [formatter stringFromDate:date];
    //NSLog(@"%@============年-月-日  时：分：秒=====================",DateTime);
    return DateTime;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
