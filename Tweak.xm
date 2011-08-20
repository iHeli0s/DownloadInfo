#import <UIKit/UIKit.h>
static BOOL menuButtonIsDown = NO;
@interface SBIcon{}
- (BOOL)isDownloadingIcon;
- (id)_realDisplayName;
- (float)progress;
- (id)displayName;
- (id)applicationBundleID;


@end


%hook SBIcon
-(void)touchesEnded:(id)touches withEvent:(id)event {
if(menuButtonIsDown && [self isDownloadingIcon]) {
float Percent = [self progress] *100;
int progress = (int)Percent;
NSString *body = [NSString stringWithFormat:@"Name: %@\nApp ID: %@ \nProgress: %i%@\nStatus: %@", [self _realDisplayName],[self applicationBundleID], progress,@"%",[self displayName]];
UIAlertView *alert = [[UIAlertView alloc]init];
alert.title = @"Download Info";
alert.message = body;
alert.delegate = self;
[alert addButtonWithTitle:@"Dismiss"];
[alert show];
[alert release];


}
else
%orig;
}

%end


%hook SpringBoard
- (void)menuButtonDown:(struct __GSEvent *)arg1 {
menuButtonIsDown = YES;
%orig;

}
- (void)menuButtonUp:(struct __GSEvent *)arg1 {
menuButtonIsDown = NO;
%orig;

}

%end