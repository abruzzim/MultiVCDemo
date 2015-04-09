//
//  ChildTVC1.m
//  MultiVCDemo
//
//  Created by dev1 on 4/8/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "ChildTVC1.h"
#import "TaskItem.h"

@interface ChildTVC1 ()

@property NSMutableArray *taskItems;

@end

@implementation ChildTVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.taskItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.taskItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"TaskCell"];
    }
    // Configure the cell...
    
    TaskItem *taskItem = [self.taskItems objectAtIndex:indexPath.row];
    cell.textLabel.text = taskItem.itemName;
    if (taskItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    TaskItem *tappedItem = [self.taskItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}

#pragma mark - Table Data

- (void)loadInitialData {
    TaskItem *item1 = [[TaskItem alloc] init];
    item1.itemName = @"Assess Patient";
    [self.taskItems addObject:item1];
    TaskItem *item2 = [[TaskItem alloc] init];
    item2.itemName = @"Give Oxygen";
    [self.taskItems addObject:item2];
    TaskItem *item3 = [[TaskItem alloc] init];
    item3.itemName = @"Place 2 IVs / IO";
    [self.taskItems addObject:item3];
    TaskItem *item4 = [[TaskItem alloc] init];
    item4.itemName = @"Draw POC Labs";
    [self.taskItems addObject:item4];
    TaskItem *item5 = [[TaskItem alloc] init];
    item5.itemName = @"Draw Labs";
    [self.taskItems addObject:item5];
    TaskItem *item6 = [[TaskItem alloc] init];
    item6.itemName = @"Give Fluids";
    [self.taskItems addObject:item6];
    TaskItem *item7 = [[TaskItem alloc] init];
    item7.itemName = @"Assess POC Labs";
    [self.taskItems addObject:item7];
    TaskItem *item8 = [[TaskItem alloc] init];
    item8.itemName = @"Treat Hypocalcemia";
    [self.taskItems addObject:item8];
    TaskItem *item9 = [[TaskItem alloc] init];
    item9.itemName = @"Treat Hypoglycemia";
    [self.taskItems addObject:item9];
    TaskItem *item10 = [[TaskItem alloc] init];
    item10.itemName = @"Treat Acidosis";
    [self.taskItems addObject:item10];
    TaskItem *item11 = [[TaskItem alloc] init];
    item11.itemName = @"Order Ceftriaxone";
    [self.taskItems addObject:item11];
    TaskItem *item12 = [[TaskItem alloc] init];
    item12.itemName = @"Order Vancomycin";
    [self.taskItems addObject:item12];
    TaskItem *item13 = [[TaskItem alloc] init];
    item13.itemName = @"Treat Hypotension";
    [self.taskItems addObject:item13];
    TaskItem *item14 = [[TaskItem alloc] init];
    item14.itemName = @"Reassess Patient";
    [self.taskItems addObject:item14];
    TaskItem *item15 = [[TaskItem alloc] init];
    item15.itemName = @"Treat Adrenal Insufficiency";
    [self.taskItems addObject:item15];
    TaskItem *item16 = [[TaskItem alloc] init];
    item16.itemName = @"Treat Hypotension";
    [self.taskItems addObject:item16];
    TaskItem *item17 = [[TaskItem alloc] init];
    item17.itemName = @"Draw Blood Culture";
    [self.taskItems addObject:item17];
    TaskItem *item18 = [[TaskItem alloc] init];
    item18.itemName = @"Give Antibiotics";
    [self.taskItems addObject:item18];
    TaskItem *item19 = [[TaskItem alloc] init];
    item19.itemName = @"Give Fluids";
    [self.taskItems addObject:item19];
}

@end
