//
//  SKViewController.m
//  Score Keeper
//
//  Created by Derik Flanary on 1/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKViewController.h"

@interface SKViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong)  UIButton *buttonTwo;
@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"THE APP";
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(15, 80, 300, 20)];
    self.label.text = @"BLUE";
    [self.view addSubview:self.label];
    
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 110, 300, 20)];
    textField.placeholder = @"Enter text here";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:textField];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(15, 150, 200, 50)];
    [self.button setTitle:@"Press Here" forState:UIControlStateNormal];
    [self.button setTintColor:[UIColor blackColor]];
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonTwo = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, 200, 50)];
    [self.buttonTwo setTitle:@"No, Press me!" forState:UIControlStateNormal];
    [self.buttonTwo setTintColor:[UIColor blackColor]];
    [self.view addSubview:self.buttonTwo];
    [self.buttonTwo addTarget:self action:@selector(buttonTwoPressed) forControlEvents:UIControlEventTouchUpInside];
    
    //label.textAlignment=NSTextAlignmentCenter;
    
    // Do any additional setup after loading the view.
}

-(void)buttonPressed {
    if (self.view.backgroundColor == [UIColor cyanColor]) {
        self.view.backgroundColor = [UIColor redColor];
        self.label.text = @"RED";
    }else{
        self.view.backgroundColor = [UIColor cyanColor];
        self.label.text = @"BLUE";
    }
}
    
    -(void)buttonTwoPressed{
        self.view.backgroundColor = [UIColor darkGrayColor];
        self.label.text = @"DEATH";
        [self.buttonTwo setTitle:@"HA HA HA HA HA HA" forState:UIControlStateNormal];
        
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
