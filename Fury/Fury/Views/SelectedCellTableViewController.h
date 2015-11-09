//
//  SelectedCellTableViewController.h
//  Fury
//
//  Created by Christopher L. Price on 11/8/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedCellTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (strong, nonatomic) IBOutlet UITableView *cellIcon;
@property (weak, nonatomic) IBOutlet UILabel *cellSubTitle;
@end
