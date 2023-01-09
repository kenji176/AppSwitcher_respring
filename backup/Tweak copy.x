#import <UIKit/UIKit.h>

@interface  SBMainSwitcherViewController : UIViewController
@end

%hook SBMainSwitcherViewController
-(void) viewDidLoad {
	%orig;
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        CGRect   buttonFrame = btn.frame;
        buttonFrame.size = CGSizeMake(200, 100);
        btn.frame = buttonFrame;
        [btn setTitle:@"XXXXXXボタン" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(push_btn:)
                forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:btn];
}
%new
-(void)push_btn:(UIButton*)button{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"タイトル"
                                                message:@"メッセージそのもの"
                                                delegate:self
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:@"開く", nil];
        [alert show];
}
%end