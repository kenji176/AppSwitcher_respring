#import <stdlib.h>
#import <spawn.h>
#import <UIKit/UIKit.h>



@interface  SBSwitcherAppSuggestionViewController : UIViewController
@end



%hook SBSwitcherAppSuggestionViewController
-(void) viewDidLoad {
　　%orig;
    NSString *btn_path = @"/Library/Application Support/Tweak_image/restart.png";
    NSString *frame_path = @"/Library/Application Support/Tweak_image/frame.png";

　　UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *btn_img = [UIImage imageNamed:btn_path];
    UIImage *frame_img = [UIImage imageNamed:frame_path];
    UIImageView *base = [[UIImageView alloc] initWithImage:frame_img];

    base.frame = CGRectMake((414-350)/2, 800, 350, 70);
    btn.frame = CGRectMake(320, 813, 40, 40);

    [btn setBackgroundImage:btn_img forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(push_btn:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:base];
    [self.view addSubview:btn];
}
%new
-(void)push_btn:(UIButton*)button{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"リスプリングを実行"
                                                message:nil
                                                delegate:self
                                        cancelButtonTitle:@"いいえ"
                                        otherButtonTitles:@"はい",nil];
										alert.tag = 100;
        [alert show];
}
%new
-(void) alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 100) {
        if (buttonIndex == 1) {
		pid_t pid;
            	int status;
            	const char* args[] = {"killall","-9","backboardd",NULL};
            	posix_spawn(&pid,"usr/bin/killall",NULL,NULL,(char* const*)args,NULL);
            	waitpid(pid,&status,WEXITED);
        }
    }
    else {
     //pass
    }

}
%end
