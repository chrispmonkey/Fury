//
//  WorkshopCell.h
//  Fury
//
//  Created by Christopher L. Price on 11/7/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "PSCollectionViewCell.h"

@interface WorkshopCell : PSCollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *workshopImage;
@property (weak, nonatomic) IBOutlet UILabel *workshopTitle;
@property (weak, nonatomic) IBOutlet UITextView *workshopDescription;
@end
