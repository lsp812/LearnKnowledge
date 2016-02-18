//
//  ViewController.m
//  LearnKnowledge
//
//  Created by 大麦 on 16/2/15.
//  Copyright (c) 2016年 lsp. All rights reserved.
//

#import "ViewController.h"
#import "MacroDefinitionVC.h"
#import "BlockVC.h"
#import "CacheVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self create];
}


-(void)create
{
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@"宏定义"];
    [array addObject:@"block"];
    [array addObject:@"NSCache"];
    [self createInterfaceWith:array];
}

-(void)createInterfaceWith:(NSMutableArray *)array
{
    for(int i=0;i<[array count];i++)
    {
        NSString *buttonTitle = [array objectAtIndex:i];
        UIColor *buttonTitleColor = [UIColor blackColor];
        CGRect buttonFrame = CGRectMake(100, 50+50*i, 100, 40);
        //
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:buttonTitle forState:UIControlStateNormal];
        [button setTitleColor:buttonTitleColor forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setFrame:buttonFrame];
        button.tag = i+1;
        [self.view addSubview:button];
    }
}

-(void)clickAction:(UIButton *)button
{
    int index = button.tag-1;
    NSLog(@"title = %@",button.currentTitle);
    
    switch (index) {
        case 0:
            [self enterMacro];
            break;
        case 1:
            [self enterBlock];
            break;
        case 2:
            [self enterCache];
            break;
            
        default:
            break;
    }
}

-(void)enterMacro
{
    MacroDefinitionVC *vc = [[MacroDefinitionVC alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)enterBlock
{
    BlockVC *vc = [[BlockVC alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)enterCache
{
    CacheVC *vc = [[CacheVC alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
