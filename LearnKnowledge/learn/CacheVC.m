//
//  CacheVC.m
//  LearnKnowledge
//
//  Created by 大麦 on 16/2/18.
//  Copyright (c) 2016年 lsp. All rights reserved.
//

#import "CacheVC.h"

@implementation CacheVC

-(void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    //
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setFrame:CGRectMake(100, 100, 100, 40)];
    [button setTitle:@"POP" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(popAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)popAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self start];
}

-(void)start
{
    NSCache *cache = [[NSCache alloc]init];
    cache.countLimit = 30;
    for(int i=0;i<5;i++)
    {
        NSString *string = @"http://f.hiphotos.baidu.com/zhidao/pic/item/b7003af33a87e95048e8274310385343fbf2b426.jpg";
        NSURL  *url = [NSURL URLWithString:string];
        NSData *data = [NSData dataWithContentsOfURL:url];
        [cache setObject:data forKey:[NSString stringWithFormat:@"%d",i]];
    }
    NSData *d = [cache objectForKey:@"0"];
    NSLog(@"d= %@",d);
}

@end
