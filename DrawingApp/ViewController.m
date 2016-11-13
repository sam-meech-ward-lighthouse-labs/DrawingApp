//
//  ViewController.m
//  DrawingApp
//
//  Created by Sam Meech-Ward on 2016-11-11.
//  Copyright © 2016 Sam Meech-Ward. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *listOfLines;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.listOfLines = [[NSMutableArray alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    
    NSMutableArray *line = [NSMutableArray array];
    [line addObject:[NSValue valueWithCGPoint:touchPoint]];
    
    [self.listOfLines addObject:line];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    
    NSMutableArray *line = [self.listOfLines lastObject];
    [line addObject:[NSValue valueWithCGPoint:touchPoint]];
    
    ((DrawingView *)self.view).listOfLines = self.listOfLines;
    [self.view setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
