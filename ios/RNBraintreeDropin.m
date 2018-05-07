
#import "RNBraintreeDropin.h"

@implementation RNBraintreeDropin

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(fetchDropInResultForAuthorization:(NSString *)clientToken
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{

    [BTDropInResult fetchDropInResultForAuthorization:clientToken handler:^(BTDropInResult * _Nullable result, NSError * _Nullable error) {
        if (error != nil) {
            reject(@"error", @"Error", error);
        } else {
            NSDictionary *data = @{@"paymentDescription":result.paymentDescription,
                                   @"nonce":result.paymentMethod.nonce
                                   };
            //            NSLog(@"data: %@", data);

            resolve(data);
        }
    }];
}

RCT_EXPORT_METHOD(showDropIn:(NSString *)clientTokenOrTokenizationKey
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    BTDropInRequest *request = [[BTDropInRequest alloc] init];
    BTDropInController *dropIn = [[BTDropInController alloc] initWithAuthorization:clientTokenOrTokenizationKey request:request handler:^(BTDropInController * _Nonnull controller, BTDropInResult * _Nullable result, NSError * _Nullable error) {

        NSLog(@"ERROR: %@", error);
        NSLog(@"result: %@", result);

        [self.reactRoot dismissViewControllerAnimated:YES completion:nil];

        if(error != nil){
            reject(@"error", @"Error", error);
        } else if (result.isCancelled) {
            NSError *error = [[NSError alloc] initWithDomain:@"user" code:500 userInfo:nil];
            reject(@"cancelled", @"cancelled", error);
        }
        else{
            NSDictionary *data = @{@"paymentDescription":result.paymentDescription,
                                   @"nonce":result.paymentMethod.nonce
                                   };
            //            NSLog(@"data: %@", data);

            resolve(data);
        }
    }];

    [self.reactRoot presentViewController:dropIn animated:YES completion:nil];
}

- (UIViewController*)reactRoot {
    UIViewController *root  = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *maybeModal = root.presentedViewController;

    UIViewController *modalRoot = root;

    if (maybeModal != nil) {
        modalRoot = maybeModal;
    }

    return modalRoot;
}

@end
  