//
//  UploadImage.h
//  OPF
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UploadImage : NSObject<NSURLSessionTaskDelegate>

@property (nonatomic,assign)float progress;
@property (nonatomic,copy)void(^progressBlock)(float progress);
@property (nonatomic,copy)void(^failureBlock)();

@property (nonatomic,strong)NSURLSession *session;
@property (nonatomic,strong)NSURLSessionUploadTask *sessionUploadTask;

-(void)callWebserviceToPostImageWithProgressBlock:(NSMutableDictionary *)aParams withURL:(NSString *)aStrURL withTarget:(UIViewController *)aVCObj withCompletionBlock:(void(^)(NSMutableDictionary *aMutDict))completionBlock withFailureBlock:(void(^)(NSError *error))failure;

-(void)callWebserviceToPostVideoWithProgressBlock:(NSURL *)aVideoPath withURL:(NSString *)aStrURL withTarget:(UIViewController *)aVCObj withCompletionBlock:(void(^)(NSMutableDictionary *dictionary))completionBlock withFailureBlock:(void(^)(NSError *error))failure;

-(void)CallWebServiceImageUpload:(UIImage *)image withURL:(NSString *)aStrURL withTarget:(UIViewController *)aVCObj withCompletionBlock:(void(^)(NSMutableDictionary *dictionary))completionBlock withFailureBlock:(void(^)(NSError *error))failure;

@end
