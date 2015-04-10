//
//  ParentVC.m
//  MultiVCDemo
//
//  Created by dev1 on 4/8/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "ParentVC.h"
#import "ChildTVC1.h"
#import "ChildVC2.h"
#import "ChildVC3.h"

#define STATUS_BAR_HEIGHT 20 //44 or 64 if nav bar
#define TOOLBAR_HEIGHT 44
#define TABBAR_HEIGHT 49
#define CHILD1_RATIO_HEIGHT (2.0/3.0)
#define CHILD1_RATIO_WIDTH (3.0/5.0)
#define CHILD2_RATIO_HEIGHT (2.0/3.0)
#define CHILD2_RATIO_WIDTH (1.0/2.0)
#define CHILD3_RATIO_HEIGHT (1.0/3.0)
#define CHILD3_RATIO_WIDTH 1.0


@interface ParentVC ()

@property (strong, nonatomic) ChildTVC1 *childtvc1;
@property (strong, nonatomic) ChildVC2 *childvc2;
@property (strong, nonatomic) ChildVC3 *childvc3;

@property BOOL isChild1Visible;
@property BOOL isChild2Visible;
@property BOOL isChild3Visible;

@property (strong, nonatomic) UIToolbar *toolBar;

@end

@implementation ParentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    // Children View Controllers
    self.childtvc1 = [[ChildTVC1 alloc] init];
    self.childtvc1.view.frame = CGRectMake(0,
                                           STATUS_BAR_HEIGHT,
                                           roundf(self.view.frame.size.width*CHILD1_RATIO_WIDTH),
                                           roundf((self.view.frame.size.height-(STATUS_BAR_HEIGHT+TOOLBAR_HEIGHT+TABBAR_HEIGHT))*CHILD1_RATIO_HEIGHT)
                                           );
    self.isChild1Visible = YES;
    [self addChildViewController:self.childtvc1];
    [self.view addSubview:self.childtvc1.view];
    
    self.childvc2 = [[ChildVC2 alloc] init];
    self.childvc2.view.frame = CGRectMake(roundf(self.view.frame.size.width*CHILD1_RATIO_WIDTH),
                                          STATUS_BAR_HEIGHT,
                                          roundf(self.view.frame.size.width*(1.0-CHILD1_RATIO_WIDTH)),
                                          roundf((self.view.frame.size.height-(STATUS_BAR_HEIGHT+TOOLBAR_HEIGHT+TABBAR_HEIGHT))*CHILD2_RATIO_HEIGHT)
                                          );
    self.isChild2Visible = YES;
    [self addChildViewController:self.childvc2];
    [self.view addSubview:self.childvc2.view];
    
    self.childvc3 = [[ChildVC3 alloc] init];
    self.childvc3.view.frame = CGRectMake(0,
                                          STATUS_BAR_HEIGHT+roundf((self.view.frame.size.height-(STATUS_BAR_HEIGHT+TOOLBAR_HEIGHT+TABBAR_HEIGHT))*CHILD1_RATIO_HEIGHT),
                                          roundf(self.view.frame.size.width*CHILD3_RATIO_WIDTH),
                                          roundf((self.view.frame.size.height-(STATUS_BAR_HEIGHT+TOOLBAR_HEIGHT+TABBAR_HEIGHT))*CHILD3_RATIO_HEIGHT)
                                          );
    self.isChild3Visible = YES;
    [self addChildViewController:self.childvc3];
    [self.view addSubview:self.childvc3.view];
    
    // Instantiate and configure the tool bar
    //
    self.toolBar = [[UIToolbar alloc] init];
    self.toolBar.backgroundColor = [UIColor lightGrayColor];
    self.toolBar.barStyle = UIBarStyleDefault;
    [self addToolbarItems];
    [self.view addSubview:self.toolBar];
    self.toolBar.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.toolBar
                                  attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeLeft
                                 multiplier:1
                                   constant:0]];
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.toolBar
                                  attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeRight
                                 multiplier:1
                                   constant:0]];
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.toolBar
                                  attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeBottom
                                 multiplier:1
                                   constant:-TABBAR_HEIGHT]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addToolbarItems {
    
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithTitle:@"Child1"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(doButton1:)];
    
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithTitle:@"Child2"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(doButton2:)];
    
    UIBarButtonItem *btn3 = [[UIBarButtonItem alloc] initWithTitle:@"Child3"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(doButton3:)];
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                            target:self
                                                                            action:nil];
    
    NSArray *barButtonItems = [NSArray arrayWithObjects:spacer, btn1, spacer, btn2, spacer, btn3, spacer, nil];
    
    [self.toolBar setItems:barButtonItems];
}

- (void)doButton1:(UIButton *)sender {
    NSLog(@"%%ParentVC-I-TRACE, -doButton1 called.");
    CGRect newFrame;
    if (self.isChild1Visible) {
        // Shift left by width.
        newFrame = CGRectMake(self.childtvc1.view.frame.origin.x - self.childtvc1.view.frame.size.width,
                              self.childtvc1.view.frame.origin.y,
                              self.childtvc1.view.frame.size.width,
                              self.childtvc1.view.frame.size.height);
    } else {
        // Shift right by width
        newFrame = CGRectMake(self.childtvc1.view.frame.origin.x + self.childtvc1.view.frame.size.width,
                              self.childtvc1.view.frame.origin.y,
                              self.childtvc1.view.frame.size.width,
                              self.childtvc1.view.frame.size.height);
    }
    [UIView animateWithDuration:0.3f animations:^{
        self.childtvc1.view.frame = newFrame;
    }];
    self.isChild1Visible = !self.isChild1Visible;
}

- (void)doButton2:(UIButton *)sender {
    NSLog(@"%%ParentVC-I-TRACE, -doButton2 called.");
    
    // Report the dimensions of the views.
    NSLog(@"%%doButton2-I-DEBUG, childtvc1 view frame %fH x %fW at (%f,%f).",
          self.childtvc1.view.frame.size.height,
          self.childtvc1.view.frame.size.width,
          self.childtvc1.view.frame.origin.x,
          self.childtvc1.view.frame.origin.y);
    NSLog(@"%%doButton2-I-DEBUG, childvc2 view frame %fH x %fW at (%f,%f).",
          self.childvc2.view.frame.size.height,
          self.childvc2.view.frame.size.width,
          self.childvc2.view.frame.origin.x,
          self.childvc2.view.frame.origin.y);
    NSLog(@"%%doButton2-I-DEBUG, childvc3 view frame %fH x %fW at (%f,%f).",
          self.childvc3.view.frame.size.height,
          self.childvc3.view.frame.size.width,
          self.childvc3.view.frame.origin.x,
          self.childvc3.view.frame.origin.y);
    
    CGRect newFrame;
    if (self.isChild2Visible) {
        // Shift right by width.
        newFrame = CGRectMake(self.childvc2.view.frame.origin.x + self.childvc2.view.frame.size.width,
                              self.childvc2.view.frame.origin.y,
                              self.childvc2.view.frame.size.width,
                              self.childvc2.view.frame.size.height);
    } else {
        // Shift left by width
        newFrame = CGRectMake(self.childvc2.view.frame.origin.x - self.childvc2.view.frame.size.width,
                              self.childvc2.view.frame.origin.y,
                              self.childvc2.view.frame.size.width,
                              self.childvc2.view.frame.size.height);
    }
    [UIView animateWithDuration:0.3f animations:^{
        self.childvc2.view.frame = newFrame;
    }];
    self.isChild2Visible = !self.isChild2Visible;
}

- (void)doButton3:(UIButton *)sender {
    NSLog(@"%%ParentVC-I-TRACE, -doButton3 called.");
    CGRect newFrame;
    if (self.isChild3Visible) {
        // Shift down by height.
        newFrame = CGRectMake(self.childvc3.view.frame.origin.x,
                              self.childvc3.view.frame.origin.y + self.childvc3.view.frame.size.height,
                              self.childvc3.view.frame.size.width,
                              self.childvc3.view.frame.size.height);
    } else {
        // Shift up by height
        newFrame = CGRectMake(self.childvc3.view.frame.origin.x,
                              self.childvc3.view.frame.origin.y - self.childvc3.view.frame.size.height,
                              self.childvc3.view.frame.size.width,
                              self.childvc3.view.frame.size.height);
    }
    [UIView animateWithDuration:0.3f animations:^{
        self.childvc3.view.frame = newFrame;
    }];
    self.isChild3Visible = !self.isChild3Visible;
}


@end
