#import <UIKit/UIKit.h>

%hook UIApplication

- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.camera"]) {
        return;
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *w = [[UIWindow alloc] initWithFrame:CGRectMake(20, 120, 60, 60)];
        w.windowLevel = UIWindowLevelStatusBar + 100;
        w.backgroundColor = [UIColor redColor];
        w.layer.cornerRadius = 30;
        w.hidden = NO;
        w.userInteractionEnabled = NO;
    });
}

%end
