//
//  WebClient.h
//  TMBomb
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebClient : NSObject

//+ (void)requestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;
//+ (void)requestWithUrlWithResultVerification:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;
+ (void)postRequestWithUrlWithResultVerificationandLoder:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;
+ (void)putRequestWithUrlWithResultVerificationandLoder:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;
+ (void)getRequestWithUrlWithResultVerificationandLoder:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;
+ (void)getRequestWithUrlWithResultLoder:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure ;
+ (void)deleteRequestWithUrlWithResultVerificationandLoder:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;
+ (void)postRequestWithUrlWithResultVerificationandLoderNew:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;
+ (void)getRequestWithUrlWithResultVerificationandLoderNew:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

//MultipleImage
+ (void)postRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters image:(NSMutableArray *)arrayImage imageData:(NSData *)imageSingleData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *))failure;
+ (void)postRequestWithUrlWithResultVerificationandLoderImage:(NSString *)stUrl parmeters:(NSDictionary *)parameters image:(NSMutableArray *)arrayImage imageData:(NSData *)imageSingleData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

//UploadPostImage
+ (void)postRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters imageData:(NSData *)imageUploadData videoImageData:(NSData *)videoUploadData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *))failure;
+ (void)postRequestWithUrlWithResultVerificationandLoderUploadPost:(NSString *)stUrl parmeters:(NSDictionary *)parameters  imageData:(NSData *)imageUploadData videoImageData:(NSData *)videoUploadData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

//EditUserProfie
+ (void)postRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters editimageData:(NSData *)editUserImageData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *))failure;
+ (void)postRequestWithUrlWithResultVerificationandLoderEditUserProfie:(NSString *)stUrl parmeters:(NSDictionary *)parameters  imageData:(NSData *)imageUploadData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

@end
