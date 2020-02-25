//
//  PictureTableViewController.m
//  NetSDK_Demo
//
//  Created by NetSDK on 2017/5/25.
//  Copyright © 2017年 NetSDK. All rights reserved.
//

#import "PictureTableViewController.h"
#import "Global.h"
#import "PictureViewController.h"

@interface PictureTableViewController ()

@property (nonatomic, strong) NSMutableArray *fileList;
@property (nonatomic, assign) NSUInteger tablerow;

@end

@implementation PictureTableViewController

@synthesize fileList, tablerow;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = _L(@"Local Picture");//本地图片
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:_L(@"Back") style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
    fileList = [[NSMutableArray alloc] init];
    
    [self getList];
    NSLog(@"===========");
    NSLog(@"%@",fileList);
    
}
- (void)viewDidAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
    [self getList];
    [self.tableView reloadData];
}


- (void)getList
{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *document = [pathArray objectAtIndex:0];
    NSString *fileDir = [document stringByAppendingPathComponent:@"Snap"];
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    
    fileList = (NSMutableArray*)[filemanager subpathsOfDirectoryAtPath:fileDir error:nil];
    if (fileList.count > 0) {
        [fileList sortUsingSelector:@selector(compare:)];
        fileList = (NSMutableArray*)[[fileList reverseObjectEnumerator] allObjects];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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
        NSString *fileDir = [document stringByAppendingPathComponent:@"Snap"];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [fileList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kScreenHeight/10;
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
    
    NSLog(@"%@", fileList[tablerow]);
    
    NSString *strFile = [fileList objectAtIndex:tablerow];
    NSLog(@"%@",strFile);
    
    //跳转后隐藏tabbar
    //self.hidesBottomBarWhenPushed = YES;
    
    
    self.tabBarController.tabBar.hidden = YES;
    
//    CameraViewController *camera = [[CameraViewController alloc] initWithValue:strFile];
//    [self.navigationController pushViewController:camera animated:YES];
    /*
    __weak typeof(self) weakSelf=self;
    [ImageBrowserViewController show:self type:PhotoBroswerVCTypeModal index:tablerow imagesBlock:^NSArray *{
        return weakSelf.fileList;
    }];*/
    /*
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingPathComponent:@"/Snap"];
    path = [path stringByAppendingString:@"/"];
    
    path = [path stringByAppendingString:strFile];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth*3/4)];
    image.center = CGPointMake(kScreenWidth/2, kScreenHeight/2);
    image.image = [UIImage imageWithContentsOfFile:path];
    [self.view addSubview:image];
*/
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingPathComponent:@"/Snap"];
    path = [path stringByAppendingString:@"/"];
    
    path = [path stringByAppendingString:strFile];
    
    PictureViewController *picture = [[PictureViewController alloc] initWithValue:path];
    [self.navigationController pushViewController:picture animated:YES];

}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
