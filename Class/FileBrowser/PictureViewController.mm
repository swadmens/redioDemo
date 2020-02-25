//
//  PictureViewController.m
//  NetSDK_Demo
//
//  Created by NetSDK on 2017/5/25.
//  Copyright © 2017年 NetSDK. All rights reserved.
//

#import "PictureViewController.h"
#import "Global.h"
@interface PictureViewController ()

@end

@implementation PictureViewController

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
    self.title = _L(@"Picture View");//图片浏览
    self.view.backgroundColor = BASE_BACKGROUND_COLOR;

}

-(void) viewDidAppear:(BOOL)animated
{
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth*3/4)];
    image.center = CGPointMake(kScreenWidth/2, kScreenHeight/2);
    image.image = [UIImage imageWithContentsOfFile:self.fname];
    [self.view addSubview:image];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
