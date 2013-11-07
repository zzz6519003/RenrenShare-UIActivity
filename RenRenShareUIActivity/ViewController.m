//
//  ViewController.m
//  RenRenShareUIActivity
//
//  Created by Snowmanzzz on 13-11-4.
//  Copyright (c) 2013年 zzz. All rights reserved.
//

#import "ViewController.h"
#import "RenRenShareActivity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareRenren:(id)sender {
    RenRenShareActivity *renren = [[RenRenShareActivity alloc] init];
    UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:@[self.shareContent.text] applicationActivities:@[renren]];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.shareContent resignFirstResponder];
}

@end
