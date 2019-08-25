// LocalizeHelper.m
#import "LocalizeHelper.h"

// Singleton
static LocalizeHelper* SingleLocalSystem = nil;

// my Bundle (not the main bundle!)
static NSBundle* myBundle = nil;


@implementation LocalizeHelper


//-------------------------------------------------------------
// allways return the same singleton
//-------------------------------------------------------------
+ (LocalizeHelper*) sharedLocalSystem {
    // lazy instantiation
    if (SingleLocalSystem == nil) {
        SingleLocalSystem = [[LocalizeHelper alloc] init];
    }
    return SingleLocalSystem;
}


//-------------------------------------------------------------
// initiating
//-------------------------------------------------------------
- (id) init {
    self = [super init];
    if (self) {
        // use systems main bundle as default bundle
        myBundle = [NSBundle mainBundle];
    }
    return self;
}


//-------------------------------------------------------------
// translate a string
//-------------------------------------------------------------
// you can use this macro:
// LocalizedString(@"Text");
- (NSString*) localizedStringForKey:(NSString*) key {
    // this is almost exactly what is done when calling the macro NSLocalizedString(@"Text",@"comment")
    // the difference is: here we do not use the systems main bundle, but a bundle
    // we selected manually before (see "setLanguage")
    
    NSString *locStr = [myBundle localizedStringForKey:key value:@"" table:nil];
    return locStr;
}

/*- (NSString *)localizedString:(NSString *)string forCountry:(NSString *)countryCode {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Localizable" ofType:@"strings" inDirectory:nil forLocalization:countryCode];
    NSBundle *dataBundle = [[NSBundle alloc] initWithPath:[bundlePath stringByDeletingLastPathComponent]];
    return NSLocalizedStringFromTableInBundle(string, @"Localizable", dataBundle, nil);
}

-(void)setupLang :(NSString *)lang
{
    NSString *currentLanguage = @"";
    if ([lang rangeOfString:NSLocalizedString(@"English", nil)].location != NSNotFound) {
        currentLanguage = @"Base";
    } else if ([lang rangeOfString:NSLocalizedString(@"Italian", nil)].location != NSNotFound) {
        currentLanguage = @"it";
    }
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:currentLanguage, nil] forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}*/

//-------------------------------------------------------------
// set a new language
//-------------------------------------------------------------
// you can use this macro:
// LocalizationSetLanguage(@"German") or LocalizationSetLanguage(@"de");
- (void) setLanguage:(NSString*) lang {
    
    NSString *currentLanguage = @"";
    if ([lang rangeOfString:NSLocalizedString(@"English", nil)].location != NSNotFound) {
        currentLanguage = @"Base";
    } else if ([lang rangeOfString:NSLocalizedString(@"Italian", nil)].location != NSNotFound) {
        currentLanguage = @"it";
    }
    // path to this languages bundle
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:currentLanguage ofType:@"lproj" ];
    if (path == nil) {
        // there is no bundle for that language
        // use main bundle instead
        myBundle = [NSBundle mainBundle];
    } else {
        
        // use this bundle as my bundle from now on:
        myBundle = [NSBundle bundleWithPath:path];
        
        // to be absolutely shure (this is probably unnecessary):
        if (myBundle == nil) {
            myBundle = [NSBundle mainBundle];
        }
    }
    
    //[self setupLang:lang];
}


@end
