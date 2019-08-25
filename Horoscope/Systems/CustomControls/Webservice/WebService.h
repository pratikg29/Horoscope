//
//  WebService.h
//  AFNetworkingWithJsonParsing
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebService : NSObject

+(void)postWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters progress:(NSProgress *)progress success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

+ (void)postImageRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters image:(NSMutableArray *)arrayImage imageData:(NSData *)imageSingleData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

+ (void)postEditProfileRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters editimageData:(NSData *)editUserImageData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

+ (void)postUploadRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters imageData:(NSData *)imageUploadData videoImageData:(NSData *)videoUploadData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

+(void)getWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters progress:(NSProgress *)progress success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

+(void)deleteWithUrlString:(NSString *)urlString parameters:(NSDictionary *)dictParams success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

+(void)putWithUrlString:(NSString *)urlString parameters:(NSDictionary *)dictParams success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

@end
