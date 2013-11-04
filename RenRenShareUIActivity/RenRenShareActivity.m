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
#import <Social/Social.h>

@implementation RenRenShareActivity

- (NSString *)activityType {
    return @"UIActivityTypePostToRenren";
}

- (NSString *)activityTitle {
    return @"发送到人人";
}

- (UIImage *)activityImage {
    return [UIImage imageNamed:@"ruby.png"];
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

+ (UIActivityCategory)activityCategory {
    return UIActivityCategoryShare;
}

- (UIViewController *)activityViewController {
    return [[RenRenPostViewController alloc] initWithNibName:@"RenRenPostViewController" bundle:nil];
    
    
}
@end
