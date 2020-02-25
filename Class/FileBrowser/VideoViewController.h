//
//  VideoViewController.h
//
//
//  Created by NetSDK on 17/3/15.
//  Copyright © 2017年 . All rights reserved.
//



#import <UIKit/UIKit.h>
#import "Global.h"


@class PictureTableViewController;
@class VideoWnd;

@interface VideoViewController : UIViewController

@property (strong, nonatomic) VideoWnd *viewPlay;


@property (nonatomic, weak) PictureTableViewController* homeView;


@property (nonatomic) LLONG lPlayHandle;

@property (nonatomic) LONG playPort;


@property (nonatomic, retain) NSString *fname;

-(id)initWithValue:(NSString *)value;


@end
