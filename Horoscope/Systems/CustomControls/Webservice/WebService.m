//
//  WebService.m
//  AFNetworkingWithJsonParsing
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "WebService.h"
#import "Constant.h"
#import "AFNetworking.h"

#define kDefaultErrorCode 12345

@implementation WebService

+(void)setHeaderWithManager :(AFHTTPSessionManager *)manager
{
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
}

+(void)postWithUrlString:(NSString *)urlString parameters:(NSDictionary *)dictParams progress:(NSProgress *)progress success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure
{
    [ProgressHUD show:@""];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [self setHeaderWithManager:manager];
    
    [manager POST:urlString parameters:dictParams success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        success(response);
        [ProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        failure(error);
        [ProgressHUD dismiss];
        
    }];
    
}

// Image Upload
+ (void)postImageRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters image:(NSMutableArray *)arrayImage imageData:(NSData *)imageSingleData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [ProgressHUD show:@""];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [self setHeaderWithManager:manager];
    
    [manager POST:stUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (imageSingleData.length != 0) {
            [formData appendPartWithFileData:imageSingleData name:@"main_image" fileName:@"image.png" mimeType:@"image/png"];
        }
        
        int i = 0;
        for(NSData *imageData in arrayImage)
        {
            if (imageData.length != 0)
            {
                [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"image%d",i] fileName:[NSString stringWithFormat:@"image%d.png",i] mimeType:@"image/png"];
                i++;
            }
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        success(response);
        [ProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        failure(error);
        [ProgressHUD dismiss];
    }];
}

//EditUserProfie
+ (void)postEditProfileRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters editimageData:(NSData *)editUserImageData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [ProgressHUD show:@""];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [self setHeaderWithManager:manager];
    
    [manager POST:stUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (editUserImageData.length != 0) {
            [formData appendPartWithFileData:editUserImageData name:@"image" fileName:@"image.png" mimeType:@"image/png"];
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        success(response);
        [ProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        failure(error);
        [ProgressHUD dismiss];
    }];
}

// PostUpload
+ (void)postUploadRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters imageData:(NSData *)imageUploadData videoImageData:(NSData *)videoUploadData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [ProgressHUD show:@""];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [self setHeaderWithManager:manager];
    
    [manager POST:stUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (imageUploadData.length != 0) {
            [formData appendPartWithFileData:imageUploadData name:@"post_image" fileName:@"image.png" mimeType:@"image/png"];
        }
        
        
        if (videoUploadData.length != 0) {
            [formData appendPartWithFileData:videoUploadData name:@"post_video" fileName:@"video.mp4" mimeType:@"video/mp4"];
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        success(response);
        [ProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        failure(error);
        [ProgressHUD dismiss];
        
    }];
}

+(void)getWithUrlString:(NSString *)urlString parameters:(NSDictionary *)dictParams progress:(NSProgress *)progress success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure
{
    [ProgressHUD show:@""];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [self setHeaderWithManager:manager];
    
    [manager GET:urlString parameters:dictParams success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        success(response);
        [ProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        failure(error);
        [ProgressHUD dismiss];
        
    }];

}

+(void)deleteWithUrlString:(NSString *)urlString parameters:(NSDictionary *)dictParams success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure
{
    [ProgressHUD show:@""];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [self setHeaderWithManager:manager];
    
    [manager DELETE:urlString parameters:dictParams success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
         success(response);
         [ProgressHUD dismiss];
     }
         failure:^(NSURLSessionTask *operation, NSError *error)
     {
         failure(error);
         [ProgressHUD dismiss];
     }];
    
}

+(void)putWithUrlString:(NSString *)urlString parameters:(NSDictionary *)dictParams success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure
{
    [ProgressHUD show:@""];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [self setHeaderWithManager:manager];
    
    [manager PUT:urlString parameters:dictParams success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        success(response);
        [ProgressHUD dismiss];
    }
        failure:^(NSURLSessionTask *operation, NSError *error)
    {
        failure(error);
        [ProgressHUD dismiss];
    }];
    
}


@end

