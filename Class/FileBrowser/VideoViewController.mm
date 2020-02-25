//
//  VideoViewController.m
//
//
//  Created by NetSDK on 17/3/15.
//  Copyright © 2017年 baobeikeji. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoWnd.h"
#import "dhplayEx.h"
#import <Photos/Photos.h>
#import "DHHudPrecess.h"

@interface VideoViewController ()

@end

@implementation VideoViewController
{
    DH_RealPlayType _rType;
}

@synthesize viewPlay, lPlayHandle;

-(id)initWithValue:(NSString *)value
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.fname = value;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = _L(@"Video Play");//录像播放

    self.view.backgroundColor = [UIColor whiteColor];

    
    viewPlay = [[VideoWnd alloc] init];
    viewPlay.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewPlay];
    viewPlay.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth*3/4);
    viewPlay.center = CGPointMake(kScreenWidth*0.5, kScreenHeight*0.5);

    
    self.view.backgroundColor = BASE_BACKGROUND_COLOR;
    
    PLAY_GetFreePort(&(_playPort));
    std::string strFile = [_fname UTF8String];
    NSLog(@"%s", strFile.c_str());
    PLAY_OpenFile(_playPort, (char*)strFile.c_str());
    PLAY_Play(_playPort, (__bridge void*)viewPlay);
    PLAY_PlaySoundShare(_playPort);
    
    UIButton *btnSave = [[UIButton alloc] init];
    btnSave.frame = CGRectMake(0, 0, kScreenWidth/2, kScreenHeight/20);
    btnSave.center = CGPointMake(kScreenWidth/2, kScreenHeight*0.8);
    btnSave.backgroundColor = UIColor.lightGrayColor;
    btnSave.layer.cornerRadius = 10;
    btnSave.layer.borderWidth = 1;
    [btnSave setTitle:@"Save" forState:UIControlStateNormal];
    [btnSave addTarget:self action:@selector(onBtnSave) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:btnSave];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void*)contextInf {
    if (error) {
        NSLog(@"Failed: %@", error.localizedDescription);
        MSG(@"", _L(@"Failed"), @"");
    }
    else {
        NSLog(@"Success!");
        MSG(@"", _L(@"Success"), @"");
    }
}


- (void)onBtnSave {
    
    //PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (status) {
                case PHAuthorizationStatusAuthorized:
                case PHAuthorizationStatusDenied:
                case PHAuthorizationStatusRestricted:
                case PHAuthorizationStatusNotDetermined:
                default:
                    break;
            }
        });
    }];
    
    
    if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(_fname)) {
        UISaveVideoAtPathToSavedPhotosAlbum(_fname, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    }
    
    
}

- (IBAction)onPlay
{
    std::string strFile = [_fname UTF8String];
    NSLog(@"%s", strFile.c_str());
    PLAY_OpenFile(_playPort, (char*)strFile.c_str());
    PLAY_Play(_playPort, (__bridge void*)viewPlay);
}

-(void) didMoveToParentViewController:(UIViewController *)parent
{
    if (!parent) {
        PLAY_Stop(_playPort);
        PLAY_CloseFile(_playPort);
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
