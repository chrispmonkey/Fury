//
//  NewsCell.h
//  Fury
//
//  Created by Christopher L. Price on 11/7/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "PSCollectionViewCell.h"

@interface NewsCell : PSCollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextView *newsDescription;

@end
