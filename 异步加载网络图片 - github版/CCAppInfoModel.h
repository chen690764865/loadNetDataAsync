//
//  CCAppInfoModel.h
//  异步加载网络图片 - github版
//
//  Created by chenchen on 16/7/30.
//  Copyright © 2016年 chenchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCAppInfoModel : NSObject
@property(nonatomic,copy)NSString * icon;
@property(nonatomic,copy)NSString * download;
@property(nonatomic,copy)NSString * name;

+(instancetype)appInfoModelWithDictionary:(NSDictionary *)dict;

@end
