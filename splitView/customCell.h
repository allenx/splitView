//
//  customCell.h
//  splitView
//
//  Created by Allen X on 11/25/15.
//  Copyright © 2015 Allen X. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *subject;
@property (strong, nonatomic) IBOutlet UILabel *comments;
@property (strong, nonatomic) IBOutlet UILabel *visits;
@property (strong, nonatomic) IBOutlet UIImageView *image;

@end
