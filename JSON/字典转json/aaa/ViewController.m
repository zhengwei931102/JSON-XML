//
//  ViewController.m
//  aaa
//
//  Created by stu074 on 16/3/22.
//  Copyright © 2016年 stu074. All rights reserved.
//

#import "ViewController.h"

#import "ZWTableViewCell.h"
@interface ViewController ()
{
    NSArray *pathResult;
}
@property(nonatomic,retain)UITableView *table;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTable];
    [self zhuanjson];
}
#pragma mark json转字典
- (void)createTable{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"Books" ofType:@"geojson"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    pathResult = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSLog(@"%d",pathResult.count);
   
    
}
#pragma mark 字典转json
- (void)zhuanjson{
    NSData *data1 = [NSJSONSerialization dataWithJSONObject:pathResult options:0 error:nil];
    NSString *json = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
    NSLog(@"%@",json);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
