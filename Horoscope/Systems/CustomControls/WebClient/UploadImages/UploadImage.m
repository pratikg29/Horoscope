//
//  UploadImage.m
//  OPF
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "UploadImage.h"
#import "AFNetworking.h"
#import "Reachability.h"
#import "AppDelegate.h"
#import "Constant.h"
#import "init.h"

@implementation UploadImage

-(void)callWebserviceToPostImageWithProgressBlock:(NSMutableDictionary *)aParams withURL:(NSString *)aStrURL withTarget:(UIViewController *)aVCObj withCompletionBlock:(void(^)(NSMutableDictionary *dictionary))completionBlock withFailureBlock:(void(^)(NSError *error))failure
{
    if ([self isConnected]) {
        UIImage *aImage = aParams[@"mimage"];
        NSString *aStrParamName = aParams[@"param_name"];
        
//        [aParams removeObjectForKey:@"gymimage"];
//        [aParams removeObjectForKey:@"param_name"];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:aStrURL]];
        [request setHTTPMethod:@"POST"];
        
        NSString *uuidStr = [[NSUUID UUID] UUIDString];
        [request addValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@", uuidStr] forHTTPHeaderField:@"Content-Type"];
        
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfig.allowsCellularAccess = YES;
        sessionConfig.timeoutIntervalForRequest = 30;
        sessionConfig.timeoutIntervalForResource = 30;
//        sessionConfig.HTTPMaximumConnectionsPerHost = 1;
        
        self.session =[NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
        
        NSData *fileData = UIImagePNGRepresentation(aImage);
        NSData *data = [self createBodyWithBoundary:uuidStr withDictData:aParams data:fileData filename:aStrParamName];
        
        [request setHTTPBody:data];
        
       self.sessionUploadTask = [self.session uploadTaskWithRequest:request fromData:data completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

           
           
         //    NSAssert(!error, @"%s: uploadTaskWithRequest error: %@", __FUNCTION__, error);
         // parse and interpret the response `NSData` however is appropriate for your app
         //   NSString *aStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
         // NSLog(@"ResponseString:%@",aStr);
            
            NSMutableDictionary *aMutDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
           
            dispatch_async(dispatch_get_main_queue(), ^{
                completionBlock(aMutDict);
            });
        }];
        
        [self.sessionUploadTask resume];
}
    else{
        //[TSMessage showNotificationWithTitle:@"Please check the internet connectivity." type:TSMessageNotificationTypeError];
        
        
    }
}

- (NSData *) createBodyWithBoundary:(NSString *)boundary withDictData:(NSDictionary *)aDict data:(NSData*)data filename:(NSString *)paramName
{
    NSMutableData *body = [NSMutableData data];
    
    if (data) {
        //only send these methods when transferring data as well as username and password
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", paramName,@"image.png"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Type: %@\r\n\r\n", @"image/png"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:data];
        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    for (NSString *aKey in aDict.allKeys) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@\r\n", aKey,aDict[aKey]] dataUsingEncoding:NSUTF8StringEncoding]];
        
    }
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    return body;
}



-(void)CallWebServiceImageUpload:(UIImage *)image withURL:(NSString *)aStrURL withTarget:(UIViewController *)aVCObj withCompletionBlock:(void(^)(NSMutableDictionary *dictionary))completionBlock withFailureBlock:(void(^)(NSError *error))failure
{
    if ([self isConnected])
    {
        NSData *imageData = UIImagePNGRepresentation(image);
        NSString *urlString = [ NSString stringWithFormat:@"%@",aStrURL];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"upload\"; filename=\"image.png\"\r\n"]] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:imageData]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [request setHTTPBody:body];
        
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response,NSError *error)
        {
            NSLog(@"Completed");
            NSError *e;
            NSDictionary *json_image_dict = [[NSDictionary alloc]initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e]];
            NSLog(@"%@",json_image_dict);
            if (error)
            {
                NSLog(@"error:%@", error.localizedDescription);
            }
                        
        }] resume];
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSLog(@"%@",returnData);
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfig.allowsCellularAccess = YES;
        sessionConfig.timeoutIntervalForRequest = 30;
        sessionConfig.timeoutIntervalForResource = 30;
        self.session =[NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
        self.sessionUploadTask = [self.session uploadTaskWithRequest:request fromData:body completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
        {
            NSMutableDictionary *aMutDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionBlock(aMutDict);
            });
        }];
        
        [self.sessionUploadTask resume];
    }
    else
    {
        [ToastMessage showMessageWithTitle:@"Failed" Message:[Helpers localisedString:LK_ANDROID_no_internet] BackgroundColor:ToastMessage_failed withDuration:3.0];
    }
    
}

-(void)callWebserviceToPostVideoWithProgressBlock:(NSURL *)aVideoPath withURL:(NSString *)aStrURL withTarget:(UIViewController *)aVCObj withCompletionBlock:(void(^)(NSMutableDictionary *dictionary))completionBlock withFailureBlock:(void(^)(NSError *error))failure
{
    
    if ([self isConnected])
    {
        NSData *videoData = [NSData dataWithContentsOfURL:aVideoPath];
        NSString *urlString = [ NSString stringWithFormat:@"%@",aStrURL];

        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"upload\"; filename=\"%@\"\r\n",[aVideoPath lastPathComponent]]] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:videoData]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [request setHTTPBody:body];
        
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response,NSError *error)
          {
              NSLog(@"Completed");
              NSError *e;
              NSDictionary *json_image_dict = [[NSDictionary alloc]initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e]];
              NSLog(@"%@",json_image_dict);
              if (error)
              {
                  NSLog(@"error:%@", error.localizedDescription);
              }
              
          }] resume];
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSLog(@"%@",returnData);
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfig.allowsCellularAccess = YES;
        sessionConfig.timeoutIntervalForRequest = 30;
        sessionConfig.timeoutIntervalForResource = 30;
        self.session =[NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
        self.sessionUploadTask = [self.session uploadTaskWithRequest:request fromData:body completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
        {
            NSMutableDictionary *aMutDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                      
            dispatch_async(dispatch_get_main_queue(), ^{
                                          completionBlock(aMutDict);
            });
        }];
        
        [self.sessionUploadTask resume];
    }
    else
    {
        [ToastMessage showMessageWithTitle:@"Failed" Message:[Helpers localisedString:LK_ANDROID_no_internet] BackgroundColor:ToastMessage_failed withDuration:3.0];
    }

}

- (NSData *) createBodyWithBoundaryForVideo:(NSString *)boundary data:(NSData*)data filename:(NSString *)filename
{
    NSMutableData *body = [NSMutableData data];
    
    if (data) {
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"mvideo\"; filename=\"%@\"\r\n",filename] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:data];
        
        

    }
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    return body;
}



#pragma mark - NSURLSession Delegate Methods


// From <NSURLSessionTaskDelegate>  (Not Getting Called)
- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
   didSendBodyData:(int64_t)bytesSent
    totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
{
    
    
    if (self.progressBlock) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressBlock(totalBytesSent/(totalBytesExpectedToSend* 1.0f));
        });
    }
}

// From <NSURLSessionTaskDelegate>  (Not Getting Called)
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (error!=nil && self.failureBlock) {
        self.failureBlock();
    }
}


-(BOOL)isConnected
{
    if ([Reachability reachabilityWithHostName:URL_main]) {
        return YES;
    }
    else
        return NO;
}

@end
