//
//  TTGExample4ViewController.m
//  TTGTagCollectionView
//
//  Created by tutuge on 2016/10/1.
//  Copyright © 2016年 zekunyan. All rights reserved.
//

#import "TTGExample4ViewController.h"
#import "TTGExample4TableViewCell.h"

@interface TTGExample4ViewController ()
@property (nonatomic, strong) NSArray *allTags;
@property (nonatomic, strong) NSMutableArray *cellInfos;
@end

@implementation TTGExample4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 80;
    
    _allTags = @[
                 @"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                 @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                 @"on", @"constraints", @"placed", @"on", @"those", @"views"
                 ];
    _cellInfos = [NSMutableArray new];
    for (NSInteger i = 0; i < 50; i++) {
        [_cellInfos addObject:[_allTags subarrayWithRange:NSMakeRange(0, i % (_allTags.count + 1))]];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TTGExample4TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TTGExample4TableViewCell class])
                                                            forIndexPath:indexPath];
    [cell setTags:_cellInfos[(NSUInteger) indexPath.row]];
    cell.label.text = [NSString stringWithFormat:@"Cell: %ld", (long)indexPath.row];
    
    return cell;
}

@end
