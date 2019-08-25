//
//  Helpers.h
//  MusicPlay
//
//  Created by Rising_Dharmik on 30/7/18.
//  Copyright © 2016 SahajanandInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Constant.h"


@interface Helpers : NSObject

//File

+(NSString *)getFilename;
+(NSURL *)getfilepathURLFromFilename:(NSString *)filename;
+(void)removeFileFromPath :(NSURL *)url;

//Datetime

+(NSString *)getCalculatedTimeFromTimer :(NSTimeInterval)currentTime;
+(NSString *)setAPPDateFormat :(NSString *)str;
+(NSString *)setAPPTimeFormat :(NSString *)str;
+(NSString *)getCurrentDataTime;

//Alert

+(void)alertWithTitle:(NSString *)title andMessage:(NSString *)message;
+ (void)alertActionsWithTitle:(NSString *)title andMessage:(NSString *)message Settings:(void (^)(void))Settings;
+ (void)alertQuestionWithTitle:(NSString *)title andMessage:(NSString *)message nodo:(void (^)(void))nodo;
+ (void)alertQuestionWithTitle:(NSString *)title andMessage:(NSString *)message yesdo:(void (^)(void))yesdo;
+ (void)actionSheetControllerWithRefButton:(UIButton *)sender controller:(UIViewController *)controller Titles:(NSArray *)titles Checkmarks:(NSArray *)checkmarks withCancel:(NSString *)cancel actionBlock:(void (^)(NSInteger index))actionBlock cancelBlock:(void (^)(void))cancelBlock;


//+(NSString*)returnCountryName:(int)index;
//+ (void)saveCustomObject:(id)object key:(NSString *)key;
//+ (id)loadCustomObjectWithKey:(NSString *)key;

//Localization

+(NSString *)localisedString:(NSString *)inputString;

//Singtone

+(void)addCustomObjectToUserDefaults:(id)pObject key:(NSString *)pStrKey;
+(id)getFromNSUserDefaults:(NSString*)pForKey;
+(id)getCustomObjectToUserDefaults:(NSString *)pStrKey;


+(void)saveObjectUserDefaultWithValue:(id)value key:(NSString *)key;
+(id)getObjectUserDefaultkey:(NSString *)key;

//Others

+ (NSString *) UUIDstr;
+(NSString *)calculateLocationLat1:(CGFloat)lat1 Long1:(CGFloat)long1 Lat2:(CGFloat)lat2 Long2:(CGFloat)long2;
+(NSString *)calculateLocationMileLat1:(CGFloat)lat1 Long1:(CGFloat)long1 Lat2:(CGFloat)lat2 Long2:(CGFloat)long2;
+ (BOOL) validateUrl: (NSString *) candidate ;
@end
