#import <UIKit/UIKit.h>
#import "RCTBridgeModule.h"


@interface RNImmediatePhoneCall : NSObject <RCTBridgeModule>
@end

@implementation RNImmediatePhoneCall

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(immediatePhoneCall:(NSString *)number)
{
    dispatch_async(dispatch_get_main_queue(), ^{
      NSURL *actionUrl = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]];
      if ([[UIApplication sharedApplication] canOpenURL:actionUrl]) {
          [[UIApplication sharedApplication] openURL:actionUrl options:@{} completionHandler:nil];
      }
    });
};

@end
