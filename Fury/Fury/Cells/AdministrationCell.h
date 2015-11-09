//
//  AdministrationCell.h
//  Fury
//
//  Created by Christopher L. Price on 11/8/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "PSCollectionViewCell.h"

@interface AdministrationCell : PSCollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *administrationImage;
@property (weak, nonatomic) IBOutlet UILabel *administrationTitle;
@property (weak, nonatomic) IBOutlet UITextView *administrationDescription;

@end
