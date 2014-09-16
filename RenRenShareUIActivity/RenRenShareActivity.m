//
//  RenRenShareActivity.m
//  iB-Ball
//
//  Created by Snowmanzzz on 13-10-17.
//  Copyright (c) 2013年 Snowmanzzz. All rights reserved.
//

#import "RenRenShareActivity.h"
#import "Renren.h"
#import "RenRenPostViewController.h"
#import "IQFeedbackView.h"
#import <Social/Social.h>

@implementation RenRenShareActivity

- (NSString *)activityType {
    return @"UIActivityTypePostToRenren";
}

- (NSString *)activityTitle {
    return @"人人";
}

- (UIImage *)activityImage {
    return [UIImage imageNamed:@"renren.png"];
}


- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    
    for (id activityItem in activityItems) {
	if ([activityItem isKindOfClass:[NSString class]]) {
            return TRUE;
	}
    }
    for (id activityItem in activityItems) {
	if ([activityItem isKindOfClass:[UIImage class]]) {
            return TRUE;
	}
    }
    return FALSE;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    for (id obj in activityItems) {
        if ([obj isKindOfClass:[NSString class]]) {
            self.shareContent = obj;
        }
        if ([obj isKindOfClass:[UIViewController class]]) {
            self.controller = obj;
        }
        if ([obj isKindOfClass:[UIImage class]]) {
            self.shareImage = obj;
        }
    }
}

+ (UIActivityCategory)activityCategory {
    return UIActivityCategoryShare;
}

//- (UIViewController *)activityViewController {
//    RenRenPostViewController *rr = [[RenRenPostViewController alloc] initWithNibName:@"RenRenPostViewController" bundle:nil];
//    rr.delegate = self;
//    rr.shareContent = self.shareContent;
//    return rr;
//}

- (void)performActivity {
    IQFeedbackView *bugReport = [[IQFeedbackView alloc] initWithTitle:@"Bug Report" message:nil image:nil cancelButtonTitle:@"Cancel" doneButtonTitle:@"Send"];
    bugReport.message = self.shareContent;
    [bugReport setImage:self.shareImage];
    [bugReport setCanAddImage:YES];
    [bugReport setCanEditText:YES];
    
    [bugReport showInViewController:self.controller completionHandler:^(BOOL isCancel, NSString *message, UIImage *image) {
        if (!isCancel) {
            Renren *renren = [Renren sharedRenren];
            if (![renren isSessionValid]) {
                // login renren
                [renren authorizationWithPermisson:nil andDelegate:self];
                return;
            }
            
            if (self.shareImage) {
                [renren publishPhotoSimplyWithImage:self.shareImage caption:self.shareContent];
                //                [self.delegate activityFinish];
            } else {
                NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:10];
                [params setObject:@"status.set" forKey:@"method"];
                [params setObject:message forKey:@"status"];
                [renren requestWithParams:params andDelegate:self];
            }
            
        } else {
        }
        [bugReport dismiss];
    } andImageCompletion:^(UIImage *image) {
        self.shareImage = image;
    }];

    [self activityDidFinish:YES];
}
- (void)activityFinish {
    [self activityDidFinish:YES];
}
@end
