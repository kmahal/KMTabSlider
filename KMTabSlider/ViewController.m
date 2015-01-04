//
//  ViewController.m
//  KMTabSlider
//
//  Created by Kabir Mahal on 10/23/14.
//  Copyright (c) 2014 Kabir Mahal. All rights reserved.
//

#import "ViewController.h"
#import "KMTabSlider.h"

@interface ViewController () <KMTabSliderDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor yellowColor];
    
    KMTabSlider *slider = [[KMTabSlider alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 40) firstTitle:@"First" secondTitle:@"Second" andThirdTitle:@"Third" withSelectedColor:[UIColor blueColor] andUnselectedColor:[UIColor grayColor]];
    slider.delegate = self;
    
    [self.view addSubview:slider];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark KMTabSlider Delegate method

-(void)KMTabSlider:(KMTabSlider *)KMTabSlider itemSelected:(KMStatus)itemSelected{
    NSLog(@"%d", itemSelected);
}


@end
