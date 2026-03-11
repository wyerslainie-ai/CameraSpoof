#import <UIKit/UIKit.h>
#import <objc/runtime.h>

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *w = [[UIWindow alloc] initWithFrame:CGRectMake(20, 120, 60, 60)];
        w.windowLevel = UIWindowLevelStatusBar + 100;
        w.backgroundColor = [UIColor redColor];
        w.layer.cornerRadius = 30;
        w.hidden = NO;
        w.userInteractionEnabled = NO;
        objc_setAssociatedObject([UIApplication sharedApplication], "cswin", w, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    });
}

%end
