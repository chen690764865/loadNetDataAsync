//
//  ViewController.m
//  异步加载网络图片 - github版
//
//  Created by chenchen on 16/7/29.
//  Copyright © 2016年 chenchen. All rights reserved.
//

#import "AFNetworking.h"
#import "CCAppInfoModel.h"
#import "ViewController.h"

@interface ViewController ()
/**
 *  保存获取到的网络数据的数组
 */
@property (nonatomic, strong) NSArray* infoData;
@property (nonatomic, strong) NSOperationQueue* queue;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self loadData];
}

- (void)loadData
{

    //通过第三方框架AFN获取网络数据
    //获取获取url地址字符串
    NSString* urlString = @"https://raw.githubusercontent.com/yinqiaoyin/SimpleDemo/master/apps.json";

    //调用AFN的方法加载网络数据
    //初始化网络请求管理器
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];

    //获取网路数据
    /**
     参数:
     1. 请求的地址
     2. 请求参数
     3. 加载的进度
     4. 成功的回调
     5. 失败的回调
     */
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask* _Nonnull task, id _Nullable responseObject) {
        //        NSLog(@"%@", task);
        NSLog(@"%@ -- %@ ---- %@", responseObject, [responseObject class], [responseObject[0] class]);
        NSLog(@"%@", [NSThread currentThread]);
        //请求成功的回调  responseObject就是获取到的数据 打印它的class类型是一个数组,所以拿数据来接收,打印它的每一个元素都是字典所以遍历这个数据的到的数据类型就是字典
        NSArray* tempArray = responseObject;
        //1.初始化可变数据保存数据
        NSMutableArray* arrayData = [NSMutableArray array];
        //2.遍历临时数据
        for (NSDictionary* dict in tempArray) {
            //3.字典转模型
            CCAppInfoModel* info = [CCAppInfoModel appInfoModelWithDictionary:dict];
            //4.把模型添加到可变数组
            [arrayData addObject:info];
        }
        //5.使用全局属性来接收以便使用
        self.infoData = arrayData.copy;
//        NSLog(@"%@",self.infoData);

    }
        failure:^(NSURLSessionDataTask* _Nullable task, NSError* _Nonnull error) {
            //请求失败的回调 以后在公司做开发的时候一定要处理请求失败的回调
            NSLog(@"%@", [NSThread currentThread]);
            NSLog(@"%@", error);
            NSLog(@"请求数据失败,请做相应的处理");

        }];
}

#pragma mark - <##>

@end
