//
//  RenRenPostViewController.m
//  iB-Ball
//
//  Created by Snowmanzzz on 13-11-2.
//  Copyright (c) 2013年 Snowmanzzz. All rights reserved.
//

#import "RenRenPostViewController.h"
#import "Renren.h"

@interface RenRenPostViewController ()
@property (weak, nonatomic) IBOutlet UITextView *postBody;

@end

@implementation RenRenPostViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
    Renren *renren = [Renren sharedRenren];
    if (![renren isSessionValid]) {
        // login renren
        [renren authorizationWithPermisson:nil andDelegate:self];
        return;
    }

    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:10];
    [params setObject:@"status.set" forKey:@"method"];
    [params setObject:self.postBody.text forKey:@"status"];
    [renren requestWithParams:params andDelegate:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismiss:(id)sender {
    [self.delegate activityFinish];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)renren:(Renren *)renren requestDidReturnResponse:(ROResponse *)response {

}

- (void)renren:(Renren *)renren requestFailWithError:(ROError *)error {
    
}

@end
