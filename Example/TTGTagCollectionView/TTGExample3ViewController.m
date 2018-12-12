//
//  TTGExample3ViewController.m
//  TTGTagCollectionView
//
//  Created by tutuge on 2016/9/29.
//  Copyright © 2016年 zekunyan. All rights reserved.
//

#import "TTGExample3ViewController.h"
#import <TTGTagCollectionView/TTGTextTagCollectionView.h>

@interface TTGExample3ViewController ()
@property (nonatomic, strong) TTGTextTagCollectionView *tagView;
@end

@implementation TTGExample3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *tags = @[@"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                      @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                      @"on", @"constraints", @"placed", @"on", @"those", @"views"];
    
    _tagView = [TTGTextTagCollectionView new];
    _tagView.alignment = TTGTagCollectionAlignmentFillByExpandingWidth;
    _tagView.layer.borderColor = [UIColor grayColor].CGColor;
    _tagView.layer.borderWidth = 1;
    _tagView.translatesAutoresizingMaskIntoConstraints = NO;
    _tagView.onTapBlankArea = ^(CGPoint location) {
        NSLog(@"Blank: %@", NSStringFromCGPoint(location));
    };
    _tagView.onTapAllArea = ^(CGPoint location) {
        NSLog(@"All: %@", NSStringFromCGPoint(location));
    };
    [self.view addSubview:_tagView];
    
    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[tagView]-20-|"
                                                                    options:(NSLayoutFormatOptions) 0 metrics:nil
                                                                      views:@{@"tagView": _tagView}];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_tagView
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1 constant:180];
    [self.view addConstraint:topConstraint];
    [self.view addConstraints:hConstraints];
    
    [_tagView addTags:tags];
    for (NSInteger i = 0; i < 5; i++) {
        [_tagView setTagAtIndex:arc4random_uniform((uint32_t)tags.count) selected:YES];
    }
    
    _tagView.onTapAllArea = ^(CGPoint location) {
        NSLog(@"onTapAllArea: %@", NSStringFromCGPoint(location));
    };
    _tagView.onTapBlankArea = ^(CGPoint location) {
        NSLog(@"onTapBlankArea: %@", NSStringFromCGPoint(location));
    };
}

@end
