//
//  MBRootViewController.m
//  FlatButton
//
//  Created by Mitul Bhadesiya on 19/08/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "MBRootViewController.h"
#import "MBButton.h"

@interface MBRootViewController ()

@end

@implementation MBRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MBButton *button = [[MBButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40) type:ButtonDefault];
    [button setTitle:@"Default" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClickDefaultButton) forControlEvents:UIControlEventTouchUpInside];
    
    btnCircle = [[MBButton alloc]initWithFrame:CGRectMake(100, 200, 100, 100) type:ButtonCircle];
    [btnCircle setTitle:@"Circle" forState:UIControlStateNormal];
    [btnCircle addTarget:self action:@selector(onClickCircleButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    [self.view addSubview:btnCircle];
    
}

#pragma mark - Button Action Events 

-(void)onClickDefaultButton
{
    NSLog(@"Button Click Default");
}

-(void)onClickCircleButton
{
    NSLog(@"BUtton Click Circle");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
