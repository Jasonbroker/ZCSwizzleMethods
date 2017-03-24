//
//  ViewController.m
//  swizzleMethod
//
//  Created by Jason on 3/22/16.
//  Copyright © 2016 Jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *testLabel;

@property (strong, nonatomic) UILabel *fontLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.frame), 44)];
    [self.view addSubview:self.testLabel];
    self.testLabel.textAlignment = NSTextAlignmentCenter;
    self.testLabel.text = @"Using systemFontOfSize:";
    self.testLabel.font = [UIFont systemFontOfSize:18];
    
    self.fontLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, CGRectGetWidth(self.view.frame), 44)];
    [self.view addSubview:self.fontLabel];
    self.fontLabel.textAlignment = NSTextAlignmentCenter;
    self.fontLabel.text = [NSString stringWithFormat:@"Using Font: %@", self.testLabel.font.familyName];
    self.fontLabel.font = [UIFont systemFontOfSize:12];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, CGRectGetWidth(self.view.frame), 44)];
    [self.view addSubview:button];
    [button setTitle:@"Change Font" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(test)
     forControlEvents:UIControlEventTouchUpInside];
}

- (void)test {
    self.testLabel.font = [UIFont systemFontOfSize:18];
    self.fontLabel.text = [NSString stringWithFormat:@"Using Font: %@", self.testLabel.font.familyName];
}

@end
