//
//  ReportsCell.h
//  Fury
//
//  Created by Christopher L. Price on 11/7/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "PSCollectionViewCell.h"

@interface ReportsCell : PSCollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *reportImage;
@property (weak, nonatomic) IBOutlet UILabel *reportTitle;
@property (weak, nonatomic) IBOutlet UITextView *reportDescription;
@end
