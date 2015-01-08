//
//  RSKViewController.m
//  Real-Score-Keeper
//
//  Created by Derik Flanary on 1/7/15.
//  Copyright (c) 2015 Vibe. All rights reserved.
//

#import "RSKViewController.h"

@interface RSKViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;
@end

@implementation RSKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20)];
    [self.view addSubview:self.scrollView];
    self.title = @"Score Keeper";
    
    // Do any additional setup after loading the view.
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
