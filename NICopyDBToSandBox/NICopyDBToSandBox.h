//
//  NICopyDBToSandBox.h
//  NICopyDBToSandBoxDemo
//
//  Created by nixinsheng on 2017/6/23.
//  Copyright © 2017年 nixinsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NICopyDBToSandBox : NSObject

+(BOOL)copyDBToSandBoxWithDBName:(NSString *)DBName;
+(NSArray*)getAllFileNamesArray;
@end
