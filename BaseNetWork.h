//
//  BaseNetWork.h
//  EducationPlatfrom
//
//  Created by zuoshuai on 2017/12/1.
//  Copyright © 2017年 zuoshuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "AFNetworkActivityIndicatorManager.h"
/**
 *  请求方式
 */
typedef NS_ENUM(NSUInteger, RequestHeaderType) {
    /**
     *  post请求
     */
    RequestTypePost,
    /**
     *  get请求
     */
    RequestTypeGet
};

/**
 *  网络状态
 */
typedef NS_ENUM(NSInteger, ZSNetworkStatus) {
    /**
     *  未知网络
     */
    ZSNetworkStatusUnknown             = 1 << 0,
    /**
     *  无法连接
     */
    ZSNetworkStatusNotReachable        = 1 << 1,
    /**
     *  WWAN网络
     */
    ZSNetworkStatusReachableViaWWAN    = 1 << 2,
    /**
     *  WiFi网络
     */
    ZSNetworkStatusReachableViaWiFi    = 1 << 3
};

/**
 *  请求任务
 */
typedef NSURLSessionTask ZSURLSessionTask;
/**
 *  下载进度
 *  @param bytesRead    已下载的大小
 *  @param totalBytes   总下载的大小
 */
typedef void (^ZSDownloadProgress)(int64_t bytesRead,int64_t totalBytes);

/**
 *
 */
typedef ZSDownloadProgress PostProgress;
typedef ZSDownloadProgress GetProgress;
/**
 *  请求成功的回调
 */
typedef void(^RequestSuccessBlock)(id response);
/**
 *  请求失败的回调
 */
typedef void(^RequestFailureBlock)(NSError *error);

@interface BaseNetWork : NSObject
/**
 *  请求成功结果
 */
@property(nonatomic,readonly,strong) id responseObject;
/**
 *  请求失败结果
 */
@property(nonatomic,readonly,strong) NSError *error;
/**
 *  成功block
 */
@property(nonatomic,copy) RequestSuccessBlock successCompletionBlock;
/**
 *  失败block
 */
@property(nonatomic,copy) RequestFailureBlock failureCompletionBlock;
/**
 *  Post请求
 *  @param refresh 是否刷新
 *  @param cache   是否缓存
 *  @param params  参数字典
 *  @param progressBlock    下载进度
 *  @param successBlock     成功回调
 *  @param failureBlock     失败回调
 */
+ (ZSURLSessionTask *)postWithUrl:(NSString *)url
                   refreshRequest:(BOOL)refresh
                            cache:(BOOL)cache
                           params:(NSDictionary *)params
                    progressBlock:(PostProgress)progressBlock
                     successBlock:(RequestSuccessBlock)successBlock
                     failureBlock:(RequestFailureBlock)failureBlock;
/**
 *  GET请求
 *
 *  @param url              请求路径
 *  @param cache            是否缓存
 *  @param refresh          是否刷新请求(遇到重复请求，若为YES，则会取消旧的请求，用新的请求，若为NO，则忽略新请求，用旧请求)
 *  @param params           拼接参数
 *  @param progressBlock    进度回调
 *  @param successBlock     成功回调
 *  @param failBlock        失败回调
 *
 *  @return 返回的对象中可取消请求
 */
+ (ZSURLSessionTask *)getWithUrl:(NSString *)url
                  refreshRequest:(BOOL)refresh
                           cache:(BOOL)cache
                          params:(NSDictionary *)params
                   progressBlock:(GetProgress)progressBlock
                    successBlock:(RequestSuccessBlock)successBlock
                       failBlock:(RequestFailureBlock)failBlock;
/**
 *  配置header
 */
+ (void)configHttpHeader:(NSDictionary *)httpHeader;
/**
 *  检查网络状态
 */
+ (void)checkNetworkStatus;
@end
