//
//  NSString+Helper.m
//  Version 0.1
//  Created by Manish Rathi on 3.9.13.
//

#import "NSString+DNSStringLocalised.h"
#import "Helpers.h"

@implementation NSString (DNSStringLocalised)

+(NSString *)initWithString_WalkThoughout_SkipButon
{
    return [Helpers localisedString:@"Skip"];
}

+(NSString *)initWithString_LoginScreen_LoginButon
{
    return [Helpers localisedString:@"Login"];
}

+(NSString *)initWithString_LoginScreen_YesButton
{
    return [Helpers localisedString:@"YES"];
}

+(NSString *)initWithString_LoginScreen_NoButton
{
    return [Helpers localisedString:@"NO"];
}

+(NSString *)initWithString_LoginScreen_ForgotTitel
{
    return [Helpers localisedString:@"Forgot Password"];
}

+(NSString *)initWithString_LoginScreen_ForgotButon
{
    return [Helpers localisedString:@"Forgot Password?"];
}

+(NSString *)initWithString_LoginScreen_RegisterButon
{
    return [Helpers localisedString:@"Register"];
}

+(NSString *)initWithString_RegisterScreen_BackButon
{
    return [Helpers localisedString:@"Back"];
}

+(NSString *)initWithString_RegisterScreen_TitleLable
{
    return [Helpers localisedString:@"Are you an Employee of DataReady?"];
}

+(NSString *)initWithString_RegisterScreen_TitleVerification
{
     return [Helpers localisedString:@"Verification"];
}

+(NSString *)initWithString_RegisterScreen_TitleEmailSent
{
     return [Helpers localisedString:@"Email verification code has been sent"];
}

+(NSString *)initWithString_RegisterScreen_ConfirmButton
{
     return [Helpers localisedString:@"Confirm"];
}

+(NSString *)initWithString_Threads_TabbarTitle1
{
    return [Helpers localisedString:@"Active"];
}

+(NSString *)initWithString_Threads_TabbarTitle2
{
    return [Helpers localisedString:@"Closed"];
}

+(NSString *)initWithString_PostThreads_OrderTitle
{
    return [Helpers localisedString:@"Is this related to Purchase Order?"];
}

+(NSString *)initWithString_PostThreads_ItemTitle
{
    return [Helpers localisedString:@"Is this specific to a Line Item?"];
}

+(NSString *)initWithString_PostThreads_OrgTitle
{
    return [Helpers localisedString:@"Org:"];
}

+(NSString *)initWithString_PostThreads_DateTitle
{
    return [Helpers localisedString:@"Date:"];
}

+(NSString *)initWithString_Chat_ResolvedButton
{
    return [Helpers localisedString:@"Resolved"];
}

+(NSString *)initWithString_Chat_SubjectTitle
{
    return [Helpers localisedString:@"Unable to create order for new bulbs"];
}

+(NSString *)initWithString_Chat_POTitle
{
    return [Helpers localisedString:@"PO#:"];
}

+(NSString *)initWithString_Chat_Ques1
{
    return [Helpers localisedString:@"What you want to improve?"];
}

+(NSString *)initWithString_Chat_Ques2
{
    return [Helpers localisedString:@"How would you like the services?"];
}

+(NSString *)initWithString_Chat_Cancel
{
    return [Helpers localisedString:@"Cancel"];
}

+(NSString *)initWithString_Chat_Done
{
    return [Helpers localisedString:@"Done"];
}

+(NSString *)initWithString_SaleThread_MoreButtonTitle
{
    return [Helpers localisedString:@"More..."];
}

+(NSString *)initWithString_SaleChat_AssociateButtonTitle
{
    return [Helpers localisedString:@"Associate Order"];
}

+(NSString *)initWithString_SaleChat_CustomerName
{
    return [Helpers localisedString:@"Associate Order"];
}

+(NSString *)initWithString_SaleChat_SOTitle
{
    return [Helpers localisedString:@"Associate Order"];
}

+(NSString *)initWithString_SaleChat_POTitle
{
    return [Helpers localisedString:@"Associate Order"];
}

+(NSString *)initWithString_SaleChat_12NCTitle
{
    return [Helpers localisedString:@"Associate Order"];
}

+(NSString *)initWithString_SaleChat_ItemTitle
{
    return [Helpers localisedString:@"Associate Order"];
}

+(NSString *)initWithString_Associate_SubjctTitle
{
    return [Helpers localisedString:@"Associate Order"];
}

+(NSString *)initWithString_Associate_CancelButton
{
    return [Helpers localisedString:@"Cancel"];
}

+(NSString *)initWithString_Associate_DoneButton
{
    return [Helpers localisedString:@"Done"];
}

+(NSString *)initWithString_Associate_ItemTitle
{
    return [Helpers localisedString:@"Is this specific to a Line Item?"];
}

+(NSString *)initWithString_CreateThread_OrderTitle
{
    return [Helpers localisedString:@"Is this related to Purchase Order?"];
}

+(NSString *)initWithString_CreateThread_ItemTitle
{
    return [Helpers localisedString:@"Is this specific to a Line Item"];
}

+(NSString *)initWithString_ActiveThread_StartON
{
    return [Helpers localisedString:@"Start on"];
}



@end
