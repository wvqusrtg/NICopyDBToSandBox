//
//  NICopyDBToSandBox.h
//  NICopyDBToSandBoxDemo
//
//  Created by nixinsheng on 2017/6/23.
//  Copyright © 2017年 nixinsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NICopyDBToSandBox : NSObject

/**
 拷贝DB模板用，不单单可以拷贝 AS.sqlite库文件，还有其他资源文件也可以通用这个方法  DATA_BASE_FILE_NAME
 
 @param DBName 数据库名称
 @return 是否拷贝成功
 */
+(BOOL)copyDBToDocumentsWithDBName:(NSString *)DBName;

/**
 获取Documents路径
 
 @return Documents路径
 */
+(NSString *)getDocumentsPath;

/**
 获取Documents路径下所有文件
 
 @return 获取到的Documents路径下所有文件NSArray列表
 */
+(NSArray*)getAllFileNamesArrayFromDocuments;

/**
 获得文件在沙盒documents文件下详细路径，名字方便记忆
 
 @param filename 文件名称要已知
 @return 文件在沙盒documents文件下详细路径
 */
+(NSString *)getFileFullPathFromDocuments:(NSString *)filename;


/**
 获取文件在工程中（产品）（Ant.ipa包里面）的详细路径
 
 @param filename 文件名称
 @return 文件在工程中（Ant.ipa包里面）的详细路径
 */
+(NSString *)getFileFullPathFromProduct:(NSString*)filename;

/**
 把NSDictionary/NSMutableArray写入到沙盒Documents文件夹内fileName(eg:UserInfo.plist文件不存在则新建文件)里

 @param dic 目标待写入字典
 @param fileName 目标写入文件名
 @return 是否写入成功
 */
+(BOOL)saveNSDictionaryForDocuments:(NSDictionary *)dic WithFileName:(NSString*)fileName;
+(BOOL)saveNSMutableArrayForDocuments:(NSMutableArray *)dic WithFileName:(NSString*)fileName;

/**
 把NSDictionary/NSMutableArray写入到产品（Ant.ipa包里面）文件夹内fileName(eg:UserInfo.plist文件不存在则新建文件)里
 
 @param dic 目标待写入字典
 @param fileName 目标写入文件名
 @return 是否写入成功
 */
+(BOOL)saveNSDictionaryForProduct:(NSDictionary *)dic WithFileName:(NSString*)fileName;
+(BOOL)saveNSMutableArrayForProduct:(NSMutableArray *)dic WithFileName:(NSString*)fileName;

/**
 加载沙盒Documents文件夹内/产品（Ant.ipa包里面）文件夹内fileName里plist数据NSDictionary/NSMutableArray

 @param fileName 文件名
 @return 加载来数据
 */
+(NSDictionary *)loadNSDictionaryFromDocumentsWithFileName:(NSString*)fileName;
+(NSDictionary *)loadNSDictionaryFromProductWithFileName:(NSString*)fileName;
+(NSArray *)loadNSArrayFromDocumentsWithFileName:(NSString*)fileName;
+(NSArray *)loadNSArrayFromProductWithFileName:(NSString*)fileName;

//判断沙盒Documents文件夹内/产品（Ant.ipa包里面）文件夹内 文件是否存在
+(BOOL) fileIsExistsFromDocumentsWithFileName:(NSString*)fileName;
+(BOOL) fileIsExistsFromProductWithFileName:(NSString*)fileName;

@end
