//
//  KMTabSlider.m
//  KMSliderBar
//
//  Created by Kabir Mahal on 10/23/14.
//  Copyright (c) 2014 Kabir Mahal. All rights reserved.
//



#import "KMTabSlider.h"

@interface KMTabSlider()

@property (strong, nonatomic) UIColor *selectedColor;
@property (strong, nonatomic) UIColor *unSelectedColor;
@property (strong, nonatomic) UISlider *slider;
@property (strong, nonatomic) UIButton *firstButton;
@property (strong, nonatomic) UIButton *secondButton;
@property (strong, nonatomic) UIButton *thirdButton;
@property (assign, nonatomic) KMStatus kmStatus;

@end


@implementation KMTabSlider


-(KMTabSlider*)initWithFrame:(CGRect)frame firstTitle:(NSString*)firstTitle secondTitle:(NSString*)secondTitle andThirdTitle:(NSString*)thirdTitle withSelectedColor:(UIColor*)selectedColor andUnselectedColor:(UIColor*)unselectedColor{
    
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 49)];
    
    if (self){
        
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        
        UIVisualEffectView *blurredView = [[UIVisualEffectView alloc] initWithEffect:effect];
        
        [blurredView setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        self.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.9f];
        
        self.selectedColor = selectedColor;
        self.unSelectedColor = unselectedColor;
        
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 25, self.frame.size.width-20, 30)];
        [_slider setMinimumTrackTintColor:[UIColor clearColor]];
        [_slider setMaximumTrackTintColor:[UIColor clearColor]];
        [_slider setValue:0.0f];
        [_slider setBackgroundColor:[UIColor clearColor]];
        [_slider setMinimumTrackTintColor:[UIColor colorWithWhite:1.0f alpha:0.9f]];
        [_slider setMaximumTrackTintColor:[UIColor clearColor]];
        [_slider setThumbImage:[UIImage imageNamed:@"sliderBottom"] forState:UIControlStateNormal];
        [_slider addTarget:self action:@selector(sliderPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self setTintColor:[UIColor blackColor]];
        
        UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 48, self.frame.size.width, 1)];
        [grayView setBackgroundColor:[UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0f]];
        [self addSubview:grayView];
        
        _firstButton = [[UIButton alloc] initWithFrame:CGRectMake(8, 10, 90, 30)];
        [_firstButton setTitle:firstTitle forState:UIControlStateNormal];
        [_firstButton setTitleColor:selectedColor forState:UIControlStateNormal];
        [_firstButton.titleLabel setFont:[UIFont fontWithName:@"NexaBold" size:20.0f]];
        [_firstButton addTarget:self action:@selector(optionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_firstButton setTag:KMFirstSelected];
        
        _secondButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2-50, 10, 100, 30)];
        [_secondButton setTitle:secondTitle forState:UIControlStateNormal];
        [_secondButton.titleLabel setFont:[UIFont fontWithName:@"NexaBold" size:20.0f]];
        [_secondButton setTitleColor:unselectedColor forState:UIControlStateNormal];
        [_secondButton addTarget:self action:@selector(optionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_secondButton setTag:KMSecondSelected];
        
        
        _thirdButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-96, 10, 90, 30)];
        [_thirdButton setTitle:thirdTitle forState:UIControlStateNormal];
        [_thirdButton setTitleColor:unselectedColor forState:UIControlStateNormal];
        [_thirdButton.titleLabel setFont:[UIFont fontWithName:@"NexaBold" size:20.0f]];
        [_thirdButton addTarget:self action:@selector(optionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_thirdButton setTag:KMThirdSelected];
        
        
        [self addSubview:_firstButton];
        [self addSubview:_slider];
        [self addSubview:_secondButton];
        [self addSubview:_thirdButton];
        
        _kmStatus = KMFirstSelected;
        
    }
    
    return self;
}


-(void)sliderPressed:(UISlider*)sender{
    
    if (sender.value < 0.25){
        
        [self handleButtonsAndSliderForTag:KMFirstSelected];
        
    } else if (sender.value > 0.24 && sender.value < 0.75 ){
        [self handleButtonsAndSliderForTag:KMSecondSelected];
        
    } else {
        [self handleButtonsAndSliderForTag:KMThirdSelected];
    }
    
}

-(void)optionButtonPressed:(UIButton*)sender{
    
    [self handleButtonsAndSliderForTag:(int)sender.tag];
    
    
}


-(void)handleButtonsAndSliderForTag:(int)tag{
    
    
    if (_kmStatus != tag){
        
        if (tag == 0){
            
            
            [_slider setValue:0.0f animated:YES];
            [self sendSubviewToBack:_slider];
            [self sendSubviewToBack:_firstButton];
            [_firstButton setTitleColor:_selectedColor forState:UIControlStateNormal];
            [_secondButton setTitleColor:_unSelectedColor forState:UIControlStateNormal];
            [_thirdButton setTitleColor:_unSelectedColor forState:UIControlStateNormal];
            _kmStatus = KMFirstSelected;

            
        } else if (tag == 1){
            
            [_slider setValue:0.5f animated:YES];
            [self sendSubviewToBack:_slider];
            [self sendSubviewToBack:_secondButton];
            [_secondButton setTitleColor:_selectedColor forState:UIControlStateNormal];
            [_firstButton setTitleColor:_unSelectedColor forState:UIControlStateNormal];
            [_thirdButton setTitleColor:_unSelectedColor forState:UIControlStateNormal];
            _kmStatus = KMSecondSelected;
            
            
        } else {
            
            [_slider setValue:1.0f animated:YES];
            [self sendSubviewToBack:_slider];
            [self sendSubviewToBack:_thirdButton];
            [_thirdButton setTitleColor:_selectedColor forState:UIControlStateNormal];
            [_firstButton setTitleColor:_unSelectedColor forState:UIControlStateNormal];
            [_secondButton setTitleColor:_unSelectedColor forState:UIControlStateNormal];
            _kmStatus = KMThirdSelected;
            
            
        }
        
        if ([(id)self.delegate respondsToSelector:@selector(KMTabSlider:itemSelected:)]){
            [self.delegate KMTabSlider:self itemSelected:_kmStatus];
        }
        
        
    } else {
        
        if (tag == 0){
            [_slider setValue:0.0f animated:YES];
        } else if (tag == 1){
            [_slider setValue:0.5f animated:YES];
        } else {
            [_slider setValue:1.0f animated:YES];
        }
        
    }
    
    
}







@end
