//
//  CCAppInfoModel.m
//  异步加载网络图片 - github版
//
//  Created by chenchen on 16/7/30.
//  Copyright © 2016年 chenchen. All rights reserved.
//

#import "CCAppInfoModel.h"

@implementation CCAppInfoModel

+ (instancetype)appInfoModelWithDictionary:(NSDictionary*)dict
{

    //创建模型对象
    CCAppInfoModel* info = [[CCAppInfoModel alloc] init];

    // KVC字典转模型
    [info setValuesForKeysWithDictionary:dict];

    //返回模型对象
    return info;
}

//模型属性比数据少的时候调用的方法
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

@end
