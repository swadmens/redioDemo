//
//  LocalViewController.m
//  IrregularTabBar
//
//  Created by JYJ on 16/5/3.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "VideoTableViewController.h"
#import "VideoViewController.h"
#import "Global.h"


@interface VideoTableViewController ()

@property (nonatomic, strong) VideoViewController *camera;
@property (nonatomic,retain) NSMutableArray* fileList;
@property (nonatomic, assign) NSUInteger tablerow;

@end

@implementation VideoTableViewController

@synthesize fileList, tablerow;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _L(@"Local Video");//本地录像
    
    self.view.backgroundColor = [UIColor whiteColor];
    

    fileList = [[NSMutableArray alloc] init];
    [self getList];
    NSLog(@"===========");
    NSLog(@"%@",fileList);

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:_L(@"Back") style:UIBarButtonItemStylePlain target:nil action:nil];

    self.view.backgroundColor = BASE_BACKGROUND_COLOR;

}

- (void)viewDidAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
    [self getList];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getList
{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *document = [pathArray objectAtIndex:0];
    NSString *fileDir = [document stringByAppendingPathComponent:@"Record"];
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    
    fileList = (NSMutableArray*)[filemanager subpathsOfDirectoryAtPath:fileDir error:nil];
    if (fileList.count > 0) {
        [fileList sortUsingSelector:@selector(compare:)];
        fileList = (NSMutableArray*)[[fileList reverseObjectEnumerator] allObjects];
    }
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kScreenHeight/10;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除操作的代码
        NSLog(@"delete !");
        
        NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *document = [pathArray objectAtIndex:0];
        NSString *fileDir = [document stringByAppendingPathComponent:@"Record"];
        fileDir = [fileDir stringByAppendingString:@"/"];
        
        tablerow = [indexPath row];
        fileDir = [fileDir stringByAppendingString:fileList[tablerow]];
        NSLog(@"%@", fileList[tablerow]);
        NSLog(@"%@", fileDir);
        NSFileManager *filemanager = [NSFileManager defaultManager];
        [filemanager removeItemAtPath:fileDir error:nil];
        
        [fileList removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [self.tableView reloadData];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fileList count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"homeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
//    cell.textLabel.text = [NSString stringWithFormat:@"picture -- %zd", indexPath.row];
    cell.textLabel.text = [fileList objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:24];
    cell.textLabel.adjustsFontSizeToFitWidth = TRUE;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tablerow = [indexPath row];
    NSLog(@"%lu",tablerow);
    g_nTableRow = [indexPath row];

    NSString *strFile = [fileList objectAtIndex:tablerow];
    NSLog(@"%@",strFile);
    
    //跳转后隐藏tabbar
    //self.hidesBottomBarWhenPushed = YES;
    
    
    self.tabBarController.tabBar.hidden = YES;
    
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingPathComponent:@"/Record"];
    path = [path stringByAppendingString:@"/"];
    
    path = [path stringByAppendingString:strFile];
    NSLog(@"path:%@", path);
    
    VideoViewController *camera = [[VideoViewController alloc] initWithValue:path];
    [self.navigationController pushViewController:camera animated:YES];
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
