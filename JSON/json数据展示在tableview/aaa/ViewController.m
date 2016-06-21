//
//  ViewController.m
//  aaa
//
//  Created by stu074 on 16/3/22.
//  Copyright © 2016年 stu074. All rights reserved.
//

#import "ViewController.h"

#import "ZWTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *pathResult;
}
@property(nonatomic,retain)UITableView *table;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.table.backgroundColor = [UIColor grayColor];
    self.table.dataSource = self;
    self.table.delegate = self;//两个代理
    [self.view addSubview:self.table];
    [self createTable];
}
- (void)createTable{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"Books" ofType:@"geojson"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    pathResult = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSLog(@"%d",pathResult.count);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return pathResult.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    static NSString *identity = @"cell";
    ZWTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:identity];
    
    if(cell==nil){
        cell = [[ZWTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identity];
    }
    
    NSMutableDictionary *b = pathResult[indexPath.row];
    cell.name.text = [b objectForKey:@"author"];
    cell.remark.text = b[@"remark"];
    cell.title.text = [b objectForKey:@"title"];
        return cell;
    
    
}
#pragma mark uitableviewdelegate代理的方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;{
    return 150.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
