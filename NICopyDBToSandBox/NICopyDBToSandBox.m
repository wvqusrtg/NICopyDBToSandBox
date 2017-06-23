//
//  NICopyDBToSandBox.m
//  NICopyDBToSandBoxDemo
//
//  Created by nixinsheng on 2017/6/23.
//  Copyright © 2017年 nixinsheng. All rights reserved.
//

#import "NICopyDBToSandBox.h"

@implementation NICopyDBToSandBox

+(BOOL)copyDBToDocumentsWithDBName:(NSString *)DBName{
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
+(NSArray*)getAllFileNamesArrayFromDocuments
{
    {
    //NSString *homeDir = NSHomeDirectory();
    // 获得此程序的沙盒路径
    //NSArray *patchs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // 获取Documents路径
    // [patchs objectAtIndex:0]
    //NSString *documentsDirectory = [patchs objectAtIndex:0];
    //NSLog(@"获取Documents路径：%@",documentsDirectory);
    //NSString *fileDirectory = [documentsDirectory stringByAppendingPathComponent:@"%@", dirName];//Documents里有文件夹的操作
    
    //NSArray *files = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:fileDirectory error:nil];
    //return files;
    }
    NSString* string = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSArray* fileList = [[NSArray alloc] initWithArray:[fileManager contentsOfDirectoryAtPath:string error:nil]];
    return fileList;
//    2017-06-23 15:37:47.304 NICopyDBToSandBoxDemo[33640:1006798] 程序沙盒Documents路径：/Users/nixinsheng/Library/Developer/CoreSimulator/Devices/4F6CB66C-C67A-4A4E-98C8-CE03F3729FA4/data/Containers/Data/Application/A03A63EF-1101-467F-9C8D-5ED8CE9E9C40/Documents
//    2017-06-23 15:37:47.307 NICopyDBToSandBoxDemo[33640:1006798] Success.
//    2017-06-23 15:37:47.307 NICopyDBToSandBoxDemo[33640:1006798] (
//                                                                  ".DS_Store",
//                                                                  "AS.sqlite"
//                                                                  )
}

+(NSString *)getDocumentsPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
    //eg：/Users/nixinsheng/Library/Developer/CoreSimulator/Devices/4F6CB66C-C67A-4A4E-98C8-CE03F3729FA4/data/Containers/Data/Application/E147C161-7DDB-4210-A6CB-EA912C293382/Documents
}

+(NSString *)getFileFullPathFromProduct:(NSString*)filename{
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@""];
    return  path;
    //eg:/Users/nixinsheng/Library/Developer/CoreSimulator/Devices/4F6CB66C-C67A-4A4E-98C8-CE03F3729FA4/data/Containers/Bundle/Application/62519FDA-CB12-40D3-ADDF-742498A17B31/NICopyDBToSandBoxDemo.app/AS.sqlite
}

+(NSString *)getFileFullPathFromDocuments:(NSString *)filename{
    NSString *documentsPath = [self getDocumentsPath];
    return [documentsPath stringByAppendingPathComponent:filename];
    //eg:/Users/nixinsheng/Library/Developer/CoreSimulator/Devices/4F6CB66C-C67A-4A4E-98C8-CE03F3729FA4/data/Containers/Data/Application/0A00E8A6-4E4A-44E6-B78E-DB7147A1CAA5/Documents/AS.sqlite
}

+(BOOL)saveNSDictionaryForDocuments:(NSDictionary *)dic WithFileName:(NSString*)fileName{
    NSString *f = [self getFileFullPathFromDocuments:fileName];
    return [dic writeToFile:f atomically:YES];
    //eg:eg:/Users/nixinsheng/Library/Developer/CoreSimulator/Devices/4F6CB66C-C67A-4A4E-98C8-CE03F3729FA4/data/Containers/Data/Application/0A00E8A6-4E4A-44E6-B78E-DB7147A1CAA5/Documents/UserInfo.plist
}

+(BOOL)saveNSMutableArrayForDocuments:(NSMutableArray *)dic WithFileName:(NSString*)fileName{
    NSString *f = [self getFileFullPathFromDocuments:fileName];
    return [dic writeToFile:f atomically:YES];
}

+(BOOL)saveNSDictionaryForProduct:(NSDictionary *)dic WithFileName:(NSString*)fileName{
    NSString *ProductPath =[[NSBundle mainBundle]  resourcePath];
    NSString *f=[ProductPath stringByAppendingPathComponent:fileName];
    return [dic writeToFile:f atomically:YES];
    //eg:/Users/nixinsheng/Library/Developer/CoreSimulator/Devices/4F6CB66C-C67A-4A4E-98C8-CE03F3729FA4/data/Containers/Bundle/Application/8506292D-F60C-4393-9FAC-1ECAFD2CFBB3/NICopyDBToSandBoxDemo.app/User.plist
}
+(BOOL)saveNSMutableArrayForProduct:(NSMutableArray *)dic WithFileName:(NSString*)fileName{
    NSString *ProductPath =[[NSBundle mainBundle]  resourcePath];
    NSString *f=[ProductPath stringByAppendingPathComponent:fileName];
    return [dic writeToFile:f atomically:YES];
}

+(NSDictionary *)loadNSDictionaryFromDocumentsWithFileName:(NSString*)fileName{
    NSString *f = [self getFileFullPathFromDocuments:fileName];
    NSDictionary *list = [ [NSDictionary alloc] initWithContentsOfFile:f];
    //return [list autorelease];
    return list;
}
+(NSDictionary *)loadNSDictionaryFromProductWithFileName:(NSString*)fileName{
    NSString *f = [self getFileFullPathFromProduct:fileName];
    NSDictionary *list = [ [NSDictionary alloc] initWithContentsOfFile:f];
    //return [list autorelease];
    return list;
}

+(NSArray*)loadNSArrayFromDocumentsWithFileName:(NSString*)fileName{
    NSString *f = [self getFileFullPathFromDocuments:fileName];
    NSArray* array = [NSArray arrayWithContentsOfFile:f];
    return array;
}
+(NSArray *)loadNSArrayFromProductWithFileName:(NSString*)fileName{
    NSString *f = [self getFileFullPathFromProduct:fileName];
    NSArray *array = [NSArray arrayWithContentsOfFile:f];
    return array;
}

+(BOOL) fileIsExistsFromDocumentsWithFileName:(NSString*)fileName{
    NSString *filePath = [self getFileFullPathFromDocuments:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:filePath];
}

+(BOOL) fileIsExistsFromProductWithFileName:(NSString*)fileName{
    NSString *filePath = [self getFileFullPathFromProduct:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:filePath];
}
@end
