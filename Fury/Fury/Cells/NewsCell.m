//
//  NewsCell.m
//  Fury
//
//  Created by Christopher L. Price on 11/7/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell{
    CGFloat height;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        height = self.frame.size.height;
    }
    return self;
}

+ (CGFloat)rowHeightForObject:(id)object inColumnWidth:(CGFloat)columnWidth{
    /*
     在这里实现动态高度的计算;
     You can calculate the cell's height here;
     */
    //return 160;
    return 300;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
@end
