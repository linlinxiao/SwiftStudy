//
//  ViewController.m
//  swiftAndOCDifference
//
//  Created by linlin on 15/12/3.
//  Copyright © 2015年 linlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    char a[] = {'a', 'b'};
    switch (a[1]) {
        case 'a':
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
