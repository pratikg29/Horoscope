//
//  Helpers.m
//  MusicPlay
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import "Helpers.h"
#import "SSKeychain.h"
#import <CoreLocation/CoreLocation.h>
#import "LocalizeHelper.h"

@implementation Helpers

#pragma mark -  File

+(NSString *)getFilename
{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMdd-HHmmss"];
    NSString *str_filename = [NSString stringWithFormat:@"file-%@-save.m4a",[dateFormat stringFromDate:today]];
    return str_filename;
}

+(NSURL *)getfilepathURLFromFilename:(NSString *)filename
{
    
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               filename,
                               nil];
    
    NSLog(@"recorderFilePath: %@",pathComponents);
    return [NSURL fileURLWithPathComponents:pathComponents];
}
+(void)removeFileFromPath :(NSURL *)url
{
    NSError *err = nil;
    
    NSData *audioData = [NSData dataWithContentsOfFile:[url path] options: 0 error:&err];
    if(audioData)
    {
        NSFileManager *fm = [NSFileManager defaultManager];
        [fm removeItemAtPath:[url path] error:&err];
    }
    if(err){
        NSLog(@"audioSession: %@ %ld %@", [err domain], (long)[err code], [[err userInfo] description]);
        return;
    }
    
}

#pragma mark -  Datetime

+(NSString *)getCalculatedTimeFromTimer :(NSTimeInterval)currentTime
{
    int totalSeconds = (int)ceil(currentTime);
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    //int hours = totalSeconds / 3600;
    
    return [NSString stringWithFormat:@"%02d:%02d",minutes, seconds];
}

+(NSString *)setAPPDateFormat :(NSString *)str
{
    if (str.length<=0) {
        return @"";
    }
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:kDateFormat];
    NSDate *date = [format dateFromString:str];
    [format setDateFormat:kDateFormatForAPP];
    NSString* finalDateString = [format stringFromDate:date];
    return finalDateString;
}

+(NSString *)setAPPTimeFormat :(NSString *)str
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:kTimeFormat];
    NSDate *date = [format dateFromString:str];
    [format setDateFormat:kTimeFormatForAPP];
    NSString* finalDateString = [format stringFromDate:date];
    return finalDateString;
}

+(NSString *)getCurrentDataTime
{
    NSDate *todayDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSString *convertedDateString = [dateFormatter stringFromDate:todayDate];
    return convertedDateString;
}

#pragma mark -  Alert Controller

+(void)alertWithTitle:(NSString *)title andMessage:(NSString *)message
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [topController presentViewController:alertController animated:YES completion:nil];
}

+ (void)alertActionsWithTitle:(NSString *)title andMessage:(NSString *)message Settings:(void (^)(void))Settings
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* Cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:Cancel];
    
    UIAlertAction* Setting = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (Settings) {
            Settings();
        }
    }];
    [alertController addAction:Setting];
    
    [topController presentViewController:alertController animated:YES completion:nil];

}

+ (void)alertQuestionWithTitle:(NSString *)title andMessage:(NSString *)message nodo:(void (^)(void))nodo
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yes = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:yes];
    
    UIAlertAction* no = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (nodo) {
            nodo();
        }
    }];
    [alertController addAction:no];
    
    [topController presentViewController:alertController animated:YES completion:nil];
    
}

+ (void)alertQuestionWithTitle:(NSString *)title andMessage:(NSString *)message yesdo:(void (^)(void))yesdo
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yes = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (yesdo) {
            yesdo();
        }
        
    }];
    [alertController addAction:yes];
    
    UIAlertAction* no = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:no];
    
    [topController presentViewController:alertController animated:YES completion:nil];
    
}

+ (void)actionSheetControllerWithRefButton:(UIButton *)sender controller:(UIViewController *)controller Titles:(NSArray *)titles Checkmarks:(NSArray *)checkmarks withCancel:(NSString *)cancel actionBlock:(void (^)(NSInteger index))actionBlock cancelBlock:(void (^)(void))cancelBlock
{

    UIAlertController *customActionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    if (titles!=nil) {
        for (NSString *str in titles) {
            UIAlertAction *buttons = [UIAlertAction actionWithTitle:str style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                //click action
                
                if (actionBlock) {
                    NSInteger index = [titles indexOfObject:action.title];
                    actionBlock(index);
                }
                
            }];
            
            
            if (checkmarks!=nil && titles.count==checkmarks.count) {
                
                NSInteger index = [titles indexOfObject:str];
                [buttons setValue:[checkmarks objectAtIndex:index] forKey:@"checked"];
            }
            
            [customActionSheet addAction:buttons];
        }

    }
    //[secondButton setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    if (cancel!=nil)
    {
        
        UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        [cancelButton setValue:[UIColor blackColor] forKey:@"titleTextColor"];
        [customActionSheet addAction:cancelButton];
    }
    
    [customActionSheet setModalPresentationStyle:UIModalPresentationPopover];
    
    UIPopoverPresentationController *popPresenter = [customActionSheet popoverPresentationController];
    popPresenter.sourceView = sender;
    popPresenter.sourceRect = sender.bounds; // You can set position of popover
    
    [controller presentViewController:customActionSheet animated:YES completion:nil];
}



#pragma mark - Add and Get Custom objects from UserDefaults

+(void)addCustomObjectToUserDefaults:(id)pObject key:(NSString *)pStrKey{
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    [currentDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:pObject] forKey:pStrKey];
    [currentDefaults synchronize];
}

+(id)getFromNSUserDefaults:(NSString*)pForKey{
    id pReturnObject;
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    pReturnObject = [defaults valueForKey:pForKey];
    return pReturnObject;
}

+(id)getCustomObjectToUserDefaults:(NSString *)pStrKey{
    id pReturnObject;
    NSData *data = [Helpers getFromNSUserDefaults:pStrKey];
    pReturnObject = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return pReturnObject;
}


+(void)saveObjectUserDefaultWithValue:(id)value key:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}

+(id)getObjectUserDefaultkey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

#pragma mark -  Localization

+(NSString *)localisedString:(NSString *)inputString
{
    return LocalizedString(inputString);
    //return NSLocalizedString(inputString, inputString);
    //return inputString;
}

#pragma mark -  Image Uploading Method

#pragma mark -  Others

+(NSString *)UUIDstr
{
    
    NSString *appName=[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
    
    NSString *strApplicationUUID = [SSKeychain passwordForService:appName account:@"incoding"];
    if (strApplicationUUID == nil)
    {
        strApplicationUUID  = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        
        [SSKeychain setPassword:strApplicationUUID forService:appName account:@"incoding"];
    }
    NSLog(@"String======%@",strApplicationUUID);
    return strApplicationUUID;
}

+(NSString *)calculateLocationLat1:(CGFloat)lat1 Long1:(CGFloat)long1 Lat2:(CGFloat)lat2 Long2:(CGFloat)long2
{
    CLLocation *locA = [[CLLocation alloc] initWithLatitude:lat1 longitude:long1];
    
    CLLocation *locB = [[CLLocation alloc] initWithLatitude:lat2 longitude:long2];
    
    CLLocationDistance distance = [locB distanceFromLocation:locA];
    
    return [NSString stringWithFormat:@"%.2f",distance/1000];
}

+(NSString *)calculateLocationMileLat1:(CGFloat)lat1 Long1:(CGFloat)long1 Lat2:(CGFloat)lat2 Long2:(CGFloat)long2
{
    CLLocation *locA = [[CLLocation alloc] initWithLatitude:lat1
                                                  longitude:long1];
    
    CLLocation *locB = [[CLLocation alloc] initWithLatitude:lat2 longitude:long2];
    CLLocationDistance distance = [locA distanceFromLocation:locB];
    return [NSString stringWithFormat:@"%.1f mi",(distance/1609.344)];
}

+ (BOOL) validateUrl: (NSString *) candidate {
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:candidate];
}


@end
