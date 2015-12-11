//
//  ViewController.h
//  splitView
//
//  Created by Allen X on 11/24/15.
//  Copyright © 2015 Allen X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "customCell.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *splitTableView;
@property (copy, nonatomic) NSMutableArray *newsList;


@end

