//
//  ChildVC1.m
//  MultiVCDemo
//
//  Created by dev1 on 4/8/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "ChildVC1.h"

@interface ChildVC1()

@end

@implementation ChildVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    button.layer.cornerRadius = 10;
    
    [button addTarget:self
               action:@selector(userDidTouchMe:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:@"Button"
            forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:32.0f];
    NSLog(@"%@", [UIFont fontNamesForFamilyName:@"Helvetica Neue"]);
    
    /*
    // List all fonts on iPhone
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily=0; indFamily<[familyNames count]; ++indFamily)
    {
        NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
        fontNames = [[NSArray alloc] initWithArray:
                     [UIFont fontNamesForFamilyName:
                      [familyNames objectAtIndex:indFamily]]];
        for (indFont=0; indFont<[fontNames count]; ++indFont)
        {
            NSLog(@"    Font name: %@", [fontNames objectAtIndex:indFont]);
        }
    }
     */
    
    button.frame = CGRectMake(180.0, 210.0, 180.0, 60.0);
    
    button.backgroundColor = [UIColor cyanColor];
    
    [button setTitleColor:[UIColor whiteColor]
                 forState:UIControlStateNormal ];
    
    [self.view addSubview:button];
    
}

- (void)userDidTouchMe:(UIButton*)button
{
    NSLog(@"%%userDidTouchMe-I-DEBUG, button touched.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
