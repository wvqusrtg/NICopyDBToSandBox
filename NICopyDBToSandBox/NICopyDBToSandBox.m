//
//  NICopyDBToSandBox.m
//  NICopyDBToSandBoxDemo
//
//  Created by nixinsheng on 2017/6/23.
//  Copyright © 2017年 nixinsheng. All rights reserved.
//

#import "NICopyDBToSandBox.h"

@implementation NICopyDBToSandBox
/**
 *  拷贝DB模板用
 *  不单单可以拷贝 AS.sqlite库文件，还有其他资源文件也可以通用这个方法  DATA_BASE_FILE_NAME
 */
+(BOOL)copyDBToSandBoxWithDBName:(NSString *)DBName{
    //取得程序运行时沙盒路径
    NSString * documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"程序沙盒Documents路径：%@",documentsPath);
    //拼接Media.db文件在沙盒里的路径
    NSString * filePath = [documentsPath stringByAppendingPathComponent:DBName];
    //可以理解为一个判断某个文件是否存在的对象
    NSFileManager * defaultManager = [NSFileManager defaultManager];
    BOOL result = NO;
    //如果在documents下面没有StudentDataBase.sqlite文件
    if (![defaultManager fileExistsAtPath:filePath]){
        //就把包种的数据库文件拷贝到沙盒 documentsPath 文件夹下
        NSString * bundleFilePath = [[NSBundle mainBundle] pathForResource:DBName ofType:nil];
        //一个用来接收错误信息的对象（直接可以理解为NSString）
        NSError * error = nil;
        //拷贝文件操作
        [defaultManager copyItemAtPath:bundleFilePath toPath:filePath error:&error];
        if (error) {
            //DLog(@"文件拷贝进沙盒失败-%@", error);
            result = NO;
        }else{
            //DLog(@"文件拷贝进沙盒成功。");
            result = YES;
        }
    }
    return result;
}

/**
 获取Documents路径下所有文件
 @return 获取到的Documents路径下所有文件NSArray列表
 */
+(NSArray*)getAllFileNamesArray
{
    // 获得此程序的沙盒路径
    NSArray *patchs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // 获取Documents路径
    // [patchs objectAtIndex:0]
    NSString *documentsDirectory = [patchs objectAtIndex:0];
    NSLog(@"获取Documents路径：%@",documentsDirectory);
    //NSString *fileDirectory = [documentsDirectory stringByAppendingPathComponent:@"%@", dirName];
    
    //NSArray *files = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:fileDirectory error:nil];
    //return files;
    
    NSString* string = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSArray* fileList = [[NSArray alloc] initWithArray:[fileManager contentsOfDirectoryAtPath:string error:nil]];
    return fileList;
}
@end
