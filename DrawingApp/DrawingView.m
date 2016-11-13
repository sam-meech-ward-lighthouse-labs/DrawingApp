//
//  DrawingView.m
//  DrawingApp
//
//  Created by Sam Meech-Ward on 2016-11-11.
//  Copyright © 2016 Sam Meech-Ward. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    for (NSArray *listOfPoints in self.listOfLines) {
        
        for (int i = 0; i < listOfPoints.count; ++i) {
            
            NSValue *pointValue = listOfPoints[i];
            CGPoint point = [pointValue CGPointValue];
            
            if (i == 0 ) {
                [path moveToPoint:point];
            } else {
                [path addLineToPoint:point];
            }
            
        }
    }

    [[UIColor orangeColor] setStroke];
    [path setLineWidth:4.0];
    [path stroke];
}


@end
