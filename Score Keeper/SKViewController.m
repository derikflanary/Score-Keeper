//
//  SKViewController.m
//  Score Keeper
//
//  Created by Derik Flanary on 1/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKViewController.h"

@interface SKViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *scoreLabels;
@property (nonatomic, strong) NSMutableArray *scoreViews;
@property (nonatomic, strong) UIButton *buttonOne;
@property (nonatomic, strong) UIButton *buttonTwo;

//@property (nonatomic, strong) UILabel *label;
//@property (nonatomic, strong) UIButton *button;
//@property (nonatomic, strong)  UIButton *buttonTwo;
@end

@implementation SKViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scoreLabels = [[NSMutableArray alloc] init];
    self.scoreViews = [[NSMutableArray alloc] init];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20)];
    [self.view addSubview:self.scrollView];
    self.title = @"Score Keeper";
    self.scrollView.alwaysBounceVertical = YES;
    
    [self addScoreView];
    
    //self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 20);
    
}

-(void)addScoreView{
    
    NSInteger index = [self.scoreViews count];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 30 * index, self.view.frame.size.width, 30)];
    view.backgroundColor = [UIColor lightGrayColor];
    
    
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, 125, 30)];
    name.placeholder = @"First name";
    name.clearButtonMode = UITextFieldViewModeWhileEditing;
    name.borderStyle = UITextBorderStyleRoundedRect;
    name.delegate = self;
    [view addSubview:name];
    
    UILabel *score = [[UILabel alloc]initWithFrame:CGRectMake(260, 0, 40, 30)];
    score.text = @"0";
    score.textAlignment = NSTextAlignmentCenter;
    [self.scoreLabels addObject:score];
    [view addSubview:score];
    
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:CGRectMake(150, 0, 30, 30)];
    stepper.minimumValue = 0;
    stepper.maximumValue = 100;
    stepper.tag = index;
    [stepper addTarget:self action:@selector(scoreStepperChanges:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:stepper];
    
    [self.scrollView addSubview:view];
  
     [self.scoreViews addObject:view];
    
    [self UpdateButtonView];
    
    //[self removeLastScore];
    
    
    
}

-(void)UpdateButtonView{
    NSInteger index = [self.scoreViews count];
    if (!self.buttonOne){
        self.buttonOne = [[UIButton alloc] initWithFrame:CGRectMake(0, 30 * index, 150, 30)];
        [self.buttonOne setTitle:@"Add Player" forState:UIControlStateNormal];
        [self.buttonOne setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.buttonOne addTarget:self action:@selector(addScoreView) forControlEvents:UIControlEventTouchUpInside];

        [self.scrollView addSubview:self.buttonOne];
    }
    self.buttonOne.frame = CGRectMake(0, 30*index, 150, 30);
    
    if (!self.buttonTwo) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(160, 30 * index, 150, 30)];
        [button setTitle:@"Remove Player" forState:UIControlStateNormal];
        [button setTintColor:[UIColor darkGrayColor]];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(removeLastScore) forControlEvents:UIControlEventTouchUpInside];
        self.buttonTwo = button;
        [self.scrollView addSubview:button];
    }
    self.buttonTwo.frame = CGRectMake(160, 30 * index, 150, 30);
}

-(void)removeLastScore{
    
    UIView *lastView = self.scoreViews.lastObject;
    [lastView removeFromSuperview];
    [self.scoreViews removeLastObject];
    NSLog(@"%lu", [self.scoreViews count]);
    [self UpdateButtonView];
    
}

-(void)scoreStepperChanges:(id)sender{
    UIStepper *theStepper = sender;
    NSInteger index = theStepper.tag;
    double value = theStepper.value;
    
    UILabel *score = self.scoreLabels[index];
    score.text = [NSString stringWithFormat:@"%d", (int) value];
    
  //NSLog(@" scorelabels: %@ count: %lu", self.scoreLabels, [self.scoreLabels count]);
    
}

-(BOOL)textFieldShouldReturn:(UITextField*) textField{
    
    [textField resignFirstResponder];
    return YES;
    
}







//    self.title = @"THE APP";
//    
//    self.view.backgroundColor = [UIColor cyanColor];
//    
//    self.label = [[UILabel alloc] initWithFrame:CGRectMake(15, 80, 300, 20)];
//    self.label.text = @"BLUE";
//    [self.view addSubview:self.label];
//    
//    
//    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 110, 300, 20)];
//    textField.placeholder = @"Enter text here";
//    textField.borderStyle = UITextBorderStyleRoundedRect;
//    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    [self.view addSubview:textField];
//    
//    self.button = [[UIButton alloc] initWithFrame:CGRectMake(15, 150, 200, 50)];
//    [self.button setTitle:@"Press Here" forState:UIControlStateNormal];
//    [self.button setTintColor:[UIColor blackColor]];
//    [self.view addSubview:self.button];
//    [self.button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
//    
//    self.buttonTwo = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, 200, 50)];
//    [self.buttonTwo setTitle:@"No, Press me!" forState:UIControlStateNormal];
//    [self.buttonTwo setTintColor:[UIColor blackColor]];
//    [self.view addSubview:self.buttonTwo];
//    [self.buttonTwo addTarget:self action:@selector(buttonTwoPressed) forControlEvents:UIControlEventTouchUpInside];
//    
//    //label.textAlignment=NSTextAlignmentCenter;
//    
//    // Do any additional setup after loading the view.
//}
//
//-(void)buttonPressed {
//    if (self.view.backgroundColor == [UIColor cyanColor]) {
//        self.view.backgroundColor = [UIColor redColor];
//        self.label.text = @"RED";
//    }else{
//        self.view.backgroundColor = [UIColor cyanColor];
//        self.label.text = @"BLUE";
//    }
//}
//    
//    -(void)buttonTwoPressed{
//        self.view.backgroundColor = [UIColor darkGrayColor];
//        self.label.text = @"DEATH";
//        [self.buttonTwo setTitle:@"HA HA HA HA HA HA" forState:UIControlStateNormal];
//        
//    }
//    
//    
//

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
