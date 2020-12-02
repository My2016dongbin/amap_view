#import "AmapSearchPlugin.h"
#if __has_include(<amap_search_muka/amap_search_muka-Swift.h>)
#import <amap_search_muka/amap_search_muka-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "amap_search_muka-Swift.h"
#endif

@implementation AmapSearchPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAmapSearchPlugin registerWithRegistrar:registrar];
}
@end
