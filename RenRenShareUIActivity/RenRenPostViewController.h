//
//  RenRenPostViewController.h
//  iB-Ball
//
//  Created by Snowmanzzz on 13-11-2.
//  Copyright (c) 2013年 Snowmanzzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Renren.h"

@protocol Activity <NSObject>

- (void)activityFinish;

@end
@interface RenRenPostViewController : UIViewController <RenrenDelegate>

@property (weak, nonatomic) id<Activity> delegate;
@end
