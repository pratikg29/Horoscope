    //
//  WebClient.m
//  TMBomb
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "WebClient.h"
#import "Constant.h"
#import "AFNetworking.h"


@implementation WebClient

+(void)setHeaderWithManager :(AFHTTPRequestOperationManager *)manager
{
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    /*if (!kDefault_SelectedLanguage) {
        [Helpers saveObjectUserDefaultWithValue:kDefaultSelectedAPP_LANGUAGE
                                            key:Tag_Language];
    }
    
    [manager.requestSerializer setValue:kDefault_SelectedLanguage forHTTPHeaderField:@"Accept-Language"];*/

}


+ (void)deleteRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *))failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [self setHeaderWithManager:manager];
    
    [manager DELETE:stUrl parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        if([responseObject isKindOfClass:[NSDictionary class]]) {
            if(success) {
                success(responseObject);
            }
        }
        else {
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            if(success) {
                success(response);
            }
        }
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
        if(failure) {
            failure(error);
        }
        
    }];
    
}

+ (void)postRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *))failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [self setHeaderWithManager:manager];
    
    [manager POST:stUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]]) {
            if(success) {
                success(responseObject);
            }
        }
        else {
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            if(success) {
                success(response);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if(failure) {
            failure(error);
        }
    }];
    
}

// Image Upload
+ (void)postRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters image:(NSMutableArray *)arrayImage imageData:(NSData *)imageSingleData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *))failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
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
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]]) {
            if(success) {
                success(responseObject);
            }
        }
        else
        {
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            if(success) {
                success(response);
            }
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"Error: %@", error);
        if(failure) {
            failure(error);
        }
    }];
}

//EditUserProfie
+ (void)postRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters editimageData:(NSData *)editUserImageData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *))failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [self setHeaderWithManager:manager];
    
    [manager POST:stUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (editUserImageData.length != 0) {
            [formData appendPartWithFileData:editUserImageData name:@"image" fileName:@"image.png" mimeType:@"image/png"];
        }
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]]) {
            if(success) {
                success(responseObject);
            }
        }
        else {
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            if(success) {
                success(response);
            }
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"Error: %@", error);
        if(failure) {
            failure(error);
        }
    }];
}

// PostUpload

+ (void)postRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters imageData:(NSData *)imageUploadData videoImageData:(NSData *)videoUploadData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *))failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [self setHeaderWithManager:manager];
    
    [manager POST:stUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (imageUploadData.length != 0) {
            [formData appendPartWithFileData:imageUploadData name:@"post_image" fileName:@"image.png" mimeType:@"image/png"];
        }
        
        
        if (videoUploadData.length != 0) {
            [formData appendPartWithFileData:videoUploadData name:@"post_video" fileName:@"video.mp4" mimeType:@"video/mp4"];
        }
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]]) {
            if(success) {
                success(responseObject);
            }
        }
        else {
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            if(success) {
                success(response);
            }
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"Error: %@", error);
        if(failure) {
            failure(error);
        }
    }];
}


+ (void)putRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *))failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [self setHeaderWithManager:manager];
    
    
    [manager PUT:stUrl parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]]) {
            if(success) {
                success(responseObject);
            }
        }
        else {
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            if(success) {
                success(response);
            }
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
        if(failure) {
            failure(error);
        }
    }];
}

+ (void)getRequestWithUrl:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *))failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [self setHeaderWithManager:manager];
    [manager GET:stUrl parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        if([responseObject isKindOfClass:[NSDictionary class]]) {
            if(success) {
                success(responseObject);
            }
        }
        else {
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            if(success) {
                success(response);
            }
        }
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
        if(failure) {
            failure(error);
        }
    }];
    
}

//EditUserProfie
+ (void)postRequestWithUrlWithResultVerificationandLoderEditUserProfie:(NSString *)stUrl parmeters:(NSDictionary *)parameters  imageData:(NSData *)imageUploadData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [ProgressHUD show:@"Please wait..." Interaction:NO];
    
    [self postRequestWithUrl:stUrl parmeters:parameters editimageData:imageUploadData success:^(NSDictionary *response) {
        
        if(success) {
            success(response);
        }
        [ProgressHUD dismiss];
        
    } failure:^(NSError *error) {
        
        if(failure) {
            [ProgressHUD dismiss];
            failure(error);
        }
    }];
    
}

//UploadPost
+ (void)postRequestWithUrlWithResultVerificationandLoderUploadPost:(NSString *)stUrl parmeters:(NSDictionary *)parameters  imageData:(NSData *)imageUploadData videoImageData:(NSData *)videoUploadData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [ProgressHUD show:@"Please wait..." Interaction:NO];
    
    [self postRequestWithUrl:stUrl parmeters:parameters imageData:imageUploadData videoImageData:videoUploadData success:^(NSDictionary *response) {
        
        if(success) {
            success(response);
        }
        [ProgressHUD dismiss];
        
    } failure:^(NSError *error) {
        
        if(failure) {
            [ProgressHUD dismiss];
            failure(error);
        }
    }];
    
}

//MultipleImage

+ (void)postRequestWithUrlWithResultVerificationandLoderImage:(NSString *)stUrl parmeters:(NSDictionary *)parameters image:(NSMutableArray *)arrayImage imageData:(NSData *)imageSingleData success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [ProgressHUD show:@"Please wait..." Interaction:NO];
    
    [self postRequestWithUrl:stUrl parmeters:parameters image:arrayImage imageData:imageSingleData success:^(NSDictionary *response) {
        
        if(success) {
            success(response);
        }
        [ProgressHUD dismiss];
        
    } failure:^(NSError *error) {
        
        if(failure) {
            [ProgressHUD dismiss];
            failure(error);
        }
    }];

}

+ (void)postRequestWithUrlWithResultVerificationandLoder:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [ProgressHUD show:@"Please wait..." Interaction:NO];
    
    [self postRequestWithUrl:stUrl parmeters:parameters success:^(NSDictionary *response) {
        if(success) {
            
            success(response);
            //[[response objectForKey:@"error"] boolValue]
        }
        [ProgressHUD dismiss];
    } failure:^(NSError *error) {
        if(failure) {
            [ProgressHUD dismiss];
            failure(error);
        }
    }];
}

+ (void)postRequestWithUrlWithResultVerificationandLoderNew:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [self postRequestWithUrl:stUrl parmeters:parameters success:^(NSDictionary *response) {
        if(success) {
            
            success(response);
            //[[response objectForKey:@"error"] boolValue]
        }
        
    } failure:^(NSError *error) {
        if(failure) {
           
            failure(error);
        }
    }];
}

+ (void)deleteRequestWithUrlWithResultVerificationandLoder:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [ProgressHUD show:@"Please wait..." Interaction:NO];

    [self deleteRequestWithUrl:stUrl parmeters:parameters success:^(NSDictionary *response) {
        if([[response objectForKey:@"error"] boolValue] == FALSE) {
            if(success) {
                success(response);
                //[[response objectForKey:@"error"] boolValue]
            }
        }
        else {
            NSError *error = [NSError errorWithDomain:@"Error" code:kDefaultErrorCode userInfo:@{NSLocalizedDescriptionKey:[response objectForKey:@"message"]}];
            if(failure) {
                [ProgressHUD dismiss];
                failure(error);
            }
        }
        [ProgressHUD dismiss];
    } failure:^(NSError *error) {
        if(failure) {
            [ProgressHUD dismiss];
            failure(error);
        }
    }];
}


+ (void)putRequestWithUrlWithResultVerificationandLoder:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [ProgressHUD show:@"Please wait..." Interaction:NO];
    
    [self putRequestWithUrl:stUrl parmeters:parameters success:^(NSDictionary *response) {
        if(success) {
            success(response);
            //[[response objectForKey:@"error"] boolValue]
        }
        [ProgressHUD dismiss];
    } failure:^(NSError *error) {
        if(failure) {
            [ProgressHUD dismiss];
            failure(error);
        }
    }];
}

+ (void)getRequestWithUrlWithResultVerificationandLoder:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [ProgressHUD show:@"Please wait..." Interaction:NO];
    
    [self getRequestWithUrl:stUrl parmeters:parameters success:^(NSDictionary *response) {
        if(success) {
            success(response);
            //[[response objectForKey:@"error"] boolValue]
        }
        [ProgressHUD dismiss];
    } failure:^(NSError *error) {
        if(failure) {
            [ProgressHUD dismiss];
            failure(error);
        }
    }];
}

+ (void)getRequestWithUrlWithResultVerificationandLoderNew:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [self getRequestWithUrl:stUrl parmeters:parameters success:^(NSDictionary *response) {
        if(success) {
            success(response);
            //[[response objectForKey:@"error"] boolValue]
        }
        
    } failure:^(NSError *error) {
        if(failure) {
            
            failure(error);
        }
    }];
}



+ (void)getRequestWithUrlWithResultLoder:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    
    [ProgressHUD show:@"Please wait..." Interaction:NO];
    
    [self getRequestWithUrl:stUrl parmeters:parameters success:^(NSDictionary *response) {
        if(success) {
            success(response);
            //[[response objectForKey:@"error"] boolValue]
        }
        [ProgressHUD dismiss];
    } failure:^(NSError *error) {
        if(failure) {
            [ProgressHUD dismiss];
            failure(error);
        }
    }];
}


/*
 
 + (void)requestWithUrlWithResultVerification:(NSString *)stUrl parmeters:(NSDictionary *)parameters success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
 [self requestWithUrl:stUrl parmeters:parameters success:^(NSDictionary *response) {
 if([[response objectForKey:@"error"] boolValue]) {
 if(success) {
 success(response);
 }
 }
 else {
 NSError *error = [NSError errorWithDomain:@"Error" code:kDefaultErrorCode userInfo:@{NSLocalizedDescriptionKey:[response objectForKey:@"message"]}];
 if(failure) {
 failure(error);
 }
 }
 } failure:^(NSError *error) {
 if(failure) {
 failure(error);
 }
 }];
 }
 
 */

@end
