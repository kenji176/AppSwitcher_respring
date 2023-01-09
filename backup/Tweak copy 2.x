#import <UIKit/UIKit.h>

@interface  SBHomeScreenViewController : UIViewController
@end

%hook SBHomeScreenViewController
-(void) viewDidLoad {
	%orig;
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        CGRect   buttonFrame = btn.frame;
        buttonFrame.size = CGSizeMake(200, 100);
        btn.frame = buttonFrame;
        [btn setTitle:@"XXXXXXボタン" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(hoge:)
                forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:btn];
}
%new
-(void)hoge:(UIButton*)button{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"タイトル"
                                                message:@"メッセージそのもの"
                                                delegate:self
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:@"開く", nil];
        [alert show];
}
%end