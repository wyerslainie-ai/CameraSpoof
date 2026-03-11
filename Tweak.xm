#import <UIKit/UIKit.h>

%ctor {
    NSString *bid = [[NSBundle mainBundle] bundleIdentifier];
    NSLog(@"[CameraSpoofer] Loaded into: %@", bid);

    if ([bid isEqualToString:@"com.apple.springboard"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            // Minimal red dot — proof of life
            UIWindow *w = [[UIWindow alloc] initWithFrame:CGRectMake(20, 120, 60, 60)];
            w.windowLevel = UIWindowLevelStatusBar + 100;
            w.backgroundColor = [UIColor redColor];
            w.layer.cornerRadius = 30;
            w.hidden = NO;
            w.userInteractionEnabled = NO;
            objc_setAssociatedObject([UIApplication sharedApplication], "cswin", w, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        });
    }
}
